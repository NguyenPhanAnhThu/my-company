class OurCustomerController < ApplicationController
    layout false
    def index
        @customers = Project.all
        @about = About.first
    end
end
