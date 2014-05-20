class PagesController < ApplicationController
  def index
    @societies = Society.all.sort_by{|s| s.joins.count }.take(10)
    @events = Event.all.sort_by{|e| e.reservations.count }.take(10)
  end
  
  def event
    
  end
end
