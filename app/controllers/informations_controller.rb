class InformationsController < ApplicationController
    layout false
    def show
        @news = News.find(params[:id])
        
        # @recruitment[:descriptions]=@recruitment[:descriptions].split("\n")
        # @print = @recruitment[:descriptions].map { |i| "Random text #{i}" }
    end
end
