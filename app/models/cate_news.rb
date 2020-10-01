class CateNews < ApplicationRecord
    has_many :news

    def self.select_all_type
        cate_news = CateNews.all
    end
end
