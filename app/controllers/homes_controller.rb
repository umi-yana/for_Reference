class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def about

  end
  
  def top

  end

  def profile
    
  end

end
