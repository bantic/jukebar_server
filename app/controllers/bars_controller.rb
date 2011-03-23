class BarsController < ApplicationController
  before_filter :load_bar_by_id
  
  def register
    @bar.register!
    render :json => @bar
  end
  
  def show
    @render_pusher = true
  end
  
  def next_song
    render :json => @bar.next_song
  end
  
  def status
    case params[:status]
    when /playing/
      @bar.playing!(params[:database_ID])
    when /paused|stopped/
      @bar.paused!
    end
    head :ok
  end
  
  private
  
  def load_bar_by_id
    @bar = Bar.find params[:id]
  end
  
end
