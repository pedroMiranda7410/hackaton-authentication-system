class SessionsController < ApplicationController

  def new
  end

  def create
    session_expiration_time = 5.seconds
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:expires_at] = (Time.now + session_expiration_time).to_i
      redirect_to root_path, notice: 'Logado com sucesso.'
    else
      flash.now[:alert] = 'Nome de usuário ou senha incorretos.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Deslogado com sucesso.'
  end
end
