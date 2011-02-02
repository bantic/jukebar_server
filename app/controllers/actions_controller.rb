class ActionsController < ApplicationController
  respond_to :html, :json
  
  def latest
    @actions = Action.all(:conditions => {:action_type => "play"}, :limit => 5, :order => "created_at desc")
    respond_with(@actions)
  end
end
