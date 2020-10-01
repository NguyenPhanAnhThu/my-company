class User < ApplicationRecord
    has_many :news
    has_secure_password
    mount_uploader :picture, AttachmentUploader # Tells rails to use this uploader for this model.   
    attr_accessor :remember_token, :activation_token, :reset_token
    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    #Returns a random token
    def self.new_token
        SecureRandom.urlsafe_base64
    end

    #Returns a user in the database for use in persistent sessions
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    #Returns true if the given token matches the digest
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    #Forget a user
    def forget
        update_attribute(:remember_digest, nil)
    end
    #Activates an account
    def activate
        update_attribute(:status, true)
        update_attribute(:activated_at, Time.zone.now)
    end
    # Sends actiovation email
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end
    
  
    # Sets the password reset attributes
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    #Sends password reset email
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end
end
