class NewsController < ApplicationController
    before_action :logged_in_user
 
    def index
        @cate_news= CateNews.select_all_type   
      
       @news = News.all
       @recruitment = News.all
   end
   
   def new 
       @news = News.new
       @cate_news= CateNews.select_all_type
   end

   def show
    @about = About.first
    @news = News.find(params[:id])
    render layout: false
   end

   def edit 
    @news = News.find(params[:id])
   end

   def create 
       @news = News.new(news_params)
       if @news.save
           flash[:success] = "Add Success"
           render 'new'  
       else
           flash[:error] = "Have some error"
           redirect_to root_url                    
       end
   end

    def update
        @news = News.find(params[:id])
        if @news.update(news_params)
            render 'edit'     
        else
            render 'edit'
        end
    end
    def destroy
        @news = News.find(params[:id])
        @news.destroy

        redirect_to @news
    end
   private 
       def  news_params
           params.require(:news).permit(:title, :infor, :description, :img, :checked, :user_id)
       end
end
