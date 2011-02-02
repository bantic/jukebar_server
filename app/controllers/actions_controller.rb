class ActionsController < ApplicationController
  before_filter :load_bar
  respond_to :json
  
  def reserve
    @actions = @bar.reserve_actions
    
    puts "actions: #{@actions.inspect}"
    render :json => @actions
  end
  
  private
  
  def load_bar
    @bar = Bar.find(params[:bar_id])
  end
end