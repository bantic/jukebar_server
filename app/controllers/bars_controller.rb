class BarsController < ApplicationController
  def register
    if @bar = Bar.find_by_id(params[:id])
      @bar.register!
    end
    render :json => @bar
  end
  
  def show
    @bar = Bar.find(params[:id])
  end
end
