class PagesController < ApplicationController
  def index
    @societies = Society.all.sort_by{|s| s.joins.count }.take(10)
    @events = Event.all.sort_by{|e| e.reservations.count }.take(10)
  end
  
  def event
    
  end
  
  def search_autocomplete
    @search = Event.find_by_name(param[:search_input]).first(10)
  end
  
  def search
    if !params[:search_method].nil?
        if params[:search_method] == "Search by society"
          @search = Society.find_all_by_name(params[:search_input]).first(10)
        elsif params[:search_method] == "Search by event"
          @search = Event.find_all_by_name(params[:search_input]).first(10)
        elsif params[:search_method] == "Search event by society"
          @search = Event.joins(:society).where("societies.name" => params[:search_input])
        elsif params[:search_method] == "Search by event type"
          @search = Event.find_all_by_type(params[:search_input]).first(10)
        end
    end
  end
  
end
