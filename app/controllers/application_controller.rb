class ApplicationController < ActionController::Base
  before_action :setup_api
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def setup_api
    begin
      api = RdSales::API.new('4750441449194766079', 
                  "3MVG9xOCXq4ID1uFvbJ9BB6PGU7wj0spaO8mfi5Jbzo44zDffWBH9.LZGSqS7KqqCfv1N9h3OUQauNAXKKLCG",
                  'thalesribeiro@salesforce.com',
                  'n3wtesteVQpvwxGIwCqrFcPmzmbV7PzE')
      @token = api.get_token
    rescue => e
      flash.now[:alert] = 'There was a problem connecting to SalesForce api'
    end
    @token
  end

end
