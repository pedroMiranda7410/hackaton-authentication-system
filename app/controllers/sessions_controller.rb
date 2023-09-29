class SessionsController < ApplicationController

  def new
  end

  def create
    session_expiration_time = 60.seconds
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:expires_at] = (Time.now + session_expiration_time).to_i
      redirect_to root_path, headers: { 'Turbo-Frame' => 'false' }, notice: 'Logado com sucesso.'
    else
      redirect_to login_path, alert: 'Email ou senha incorretos'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Deslogado com sucesso.'
  end
end
