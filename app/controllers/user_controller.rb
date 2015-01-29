class UserController < ApplicationController

  def index
    @account = User.find(params[:id]).account
  end

end
