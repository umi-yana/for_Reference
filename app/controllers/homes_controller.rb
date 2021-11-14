class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :profile, :about]
  def top
  end

  def about
  end
end
