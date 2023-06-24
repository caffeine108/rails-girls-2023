class UsersController < ApplicationController
  skip_before_action :require_login, only: [:register, :login, :create_session]

  def index
  end
  def register
    @user = User.new
    @user.email = "test"
  end

    def create
      @user = User.create(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
      )
 if @user.persisted?
redirect_to :users
    else
      redirect_to :register, notice: @user.errors.full_messages
    end
end

    def create_session
      user = User.find_by(email: params[:email])

      if user.present? && BCrypt::Password.new(user.password_digest) == params[:password]
        # hasło poprawne
        session[:current_user_id] = user.id
        redirect_to :users, notice: "Udało się zalogować"
      else
        # hasło  niepoprawne
        redirect_to :login, notice: "Niepoprawne login lub hasło"
      end
    
end
end
