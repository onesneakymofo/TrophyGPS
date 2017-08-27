class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.twitter_data"] = env["omniauth.auth"]
      redirect_to root_path
    end
  end

  def facebook
    @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to root_path
    end
  end
end
