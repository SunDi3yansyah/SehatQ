class ApplicationController < ActionController::API
  include ApplicationHelper

  include Response
  include StatusCode
  include ExceptionHandler unless Rails.env.development?
  include Patient::ApplicationConcern
end
