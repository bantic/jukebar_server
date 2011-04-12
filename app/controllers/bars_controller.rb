class BarsController < ApplicationController
  before_filter :load_user, :only => [:show]
  before_filter :load_bar_by_id
  
  def register
    @bar.register!
    render :json => @bar
  end
  
  def show
    @render_pusher = true
    if @user.name.blank?
      session[:return_bar_id] = @bar.id
      redirect_to(edit_user_path(@user)) 
    end
  end
  
  def next_song
    render :json => @bar.next_song
  end
  
  def update
    if params[:status]
      case params[:status]
      when /playing/
        @bar.playing!(params[:database_ID])
      when /paused|stopped/
        @bar.paused!
      end
    end
    head :ok
  end
  
  private
  
  def load_bar_by_id
    @bar = Bar.find params[:id]
  end
  
end
