class LeadsController < ApplicationController
	def new
		@lead = RdSales::Client.new
	end

	def create
	 @lead           = RdSales::Client.new
	 @lead.name      = params[:name]
	 @lead.last_name = params[:last_name]
	 @lead.company   = params[:company]
	 @lead.phone     = params[:phone]
	 @lead.job_tile  = params[:job_tile]
	 @lead.website   = params[:website]
	 @lead.email     = params[:email]
	 
	 action = RdSales::Action.new(@token, @lead)
	 action.json_post(@lead.to_json)
	 flash[:notice] = "Lead created successfully"
	 render :new
	end

end
