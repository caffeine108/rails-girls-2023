class ApplicationController < ActionController::Base
    before_action :require_login

    def require_login
        if session[:current_user_id]
            @current_user = User.find(session[:current_user_id])
        else
            redirect_to :login
        end

    end
end
