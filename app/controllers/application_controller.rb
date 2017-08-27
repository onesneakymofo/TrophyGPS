class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  def ensure_signup_complete
     # Ensure we don't go into an infinite loop
     return if action_name == 'finish_signup'
   end
end
