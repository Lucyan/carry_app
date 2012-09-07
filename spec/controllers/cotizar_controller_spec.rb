require 'spec_helper'

describe CotizarController do

  describe "GET 'nuevo'" do
    it "returns http success" do
      get 'nuevo'
      response.should be_success
    end
  end

end
