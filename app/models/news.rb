class News < ApplicationRecord
    belongs_to :user
    has_many :comments
    mount_uploader :img, AttachmentUploader
    has_rich_text :description

    def self.select_by_cate(cate_news_id)
        # cate_news = "select id from cate_news where id= #{cate_news_id}"
        News.select(:id, :title, :checked).where("cate_news_id IN (#{cate_news_id})")
    end
    def self.select_all
        News.select(:id, :title, :check)
    end


    
end
