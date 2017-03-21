require 'json_web_token'

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include Authentication
end
