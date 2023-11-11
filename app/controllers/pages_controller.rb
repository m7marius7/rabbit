class PagesController < ApplicationController

    def about
    end

    def search_engine_optimization
        @meta_title = "title 3 Search Engine"
        @meta_description = "description 3 Search Engine"
    end
end