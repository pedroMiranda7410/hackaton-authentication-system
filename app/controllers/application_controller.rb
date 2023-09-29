class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    add_flash_types :danger, :success, :info, :warning
    
    def is_session_expired
      @time_left = session[:expires_at] - (Time.now).to_i

      unless @time_left > 0
        session[:user_id] = nil
        session[:expires_at] = nil
        redirect_to login_path, alert: 'Sessão expirada, faça login novamente'
      end
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by_id(session[:user_id])
      else
        @current_user = nil
      end
    end
    
    def authenticate
      if current_user
        is_session_expired
      else 
        redirect_to(login_path) 
      end 
    end
end
