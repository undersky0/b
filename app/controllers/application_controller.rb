class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Serialization
  #before_action :authenticate_user!
  #protect_from_forgery with: :null_session
end
