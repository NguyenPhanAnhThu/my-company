class ExperienceLevel < ApplicationRecord
    has_many :job
    def delete_exp_level
        if self.job.size!=0
            return false
        else 
            return true
        end       
    end
end
