class ApiController < ApplicationController
  def monsters
    render :json => Monster.all
  end
end
