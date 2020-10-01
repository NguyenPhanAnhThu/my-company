class About < ApplicationRecord
    mount_uploader :logo, AttachmentUploader
    mount_uploader :favicon, AttachmentUploader
end
