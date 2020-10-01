class AllNewsController < ApplicationController
    layout false
    def index
        @news = News.all
        @about = About.first
    end
end
