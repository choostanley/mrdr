class WelcomeController < ApplicationController
  def index
  	if signed_in?
  	@notes = current_user.notes
  	end
  end
end
