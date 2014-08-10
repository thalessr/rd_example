class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def setup_api
  	begin
      api = RdSales::API.new('client_secret', 
		              "client_id",
		              'username',
		              'password')
      @token = api.get_token
    rescue => e
      flash.now[:alert] = 'There was a problem connecting to SalesForce api'
    end
    @token
  end

end
