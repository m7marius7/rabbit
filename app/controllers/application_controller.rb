class ApplicationController < ActionController::Base

    def no_index_no_follow
        @meta_robots_instructions = "noindex, nofollow"
    end
end
