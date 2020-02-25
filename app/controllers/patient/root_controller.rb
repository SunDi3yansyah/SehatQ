class Patient::RootController < ApplicationController
  # @return [Object]
  def index
    data = {
      message: "Welcome to API #{APP_NAME} (Test: Cahyadi Triyansyah)",
      initializers: {
        app_name: APP_NAME,
      }
    }
    api data
  end
end
