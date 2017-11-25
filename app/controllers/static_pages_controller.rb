class StaticPagesController < ApplicationController
  def home
    @sad_monsters = Monster.order(health: :asc).limit(4)
    @happy_monsters = Monster.order(health: :desc).limit(4)
  end

  def help
  end

  def about
  end

  def ranking
    @ranking_monsters = Monster.order(health: :desc)
  end
end
