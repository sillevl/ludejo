class ApiController < ApplicationController
  def monsters
    render :json => Monster.all
  end

  def hungry
    render :json => Monster.order(health: :asc).limit(5)
  end

  def happy
    render :json => Monster.order(health: :desc).limit(5)
  end
end
