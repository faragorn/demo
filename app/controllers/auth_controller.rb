class AuthController < ApplicationController
  before_filter :check_session, only: [:sign_in, :sign_up, :register, :activate] # check if a user has already logged in

  def sign_in
    @user = User.new
  end

  def sign_up
    @user = User.new
  end

  def login
    email = params[:user][:email]
    password = params[:user][:password]

    user = User.authenticate(email, password)

    if user
      session[:user_id] = user.id
      flash[:notice] = 'Welcome!'
      redirect_to :root
    else
      flash[:notice] = 'Email or password do not match or records'
      render :action => 'sign_in'
    end
  end

  def register
    @user = User.new(params[:user])

    if @user.valid?
      @user.activation_token = SecureRandom.urlsafe_base64
      @user.activation_expires_after = 24.hours.from_now
      @user.save
      UserMailer.welcome_email(@user).deliver
      flash[:notice] = 'Thank you for registration! Please check your mail-box for confirmation.'
      redirect_to sign_in_url
    else
      render :action => 'sign_up'
    end
  end

  def activate
    token = params.first[0]
    user = User.find_by_activation_token(token)
    if user.nil?
      flash[:error] = 'Wrong activation key. Please check your mail box.'
      redirect_to :root
      return
    end
    if user.activation_expires_after < DateTime.now
      flash[:notice] = 'Your activation has expired. Please request a new account activation.'
      redirect_to sign_in_url
    else
      user.activation_token = nil
      user.activation_expires_after = nil
      user.save

      session[:user_id] = user.id
      flash[:notice] = 'Your account was successfully activated. Please complete registration process.'
      redirect_to new_profile_url
    end
  end

  def sign_out
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
    redirect_to sign_in_url
  end

  private

  def check_session
    if current_user
      redirect_to root_url
    end
  end
end