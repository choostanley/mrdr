class WelcomeController < ApplicationController
  def index
  	if signed_in?
  	@notes = Note.all
  	end
  end
end
