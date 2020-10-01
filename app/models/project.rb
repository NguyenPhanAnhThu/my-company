class Project < ApplicationRecord
    mount_uploader :img, AttachmentUploader
end
