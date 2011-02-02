require 'spec_helper'

describe BarsController do

  describe "GET 'register'" do
    it "should be successful" do
      get 'register'
      response.should be_success
    end
  end

end
