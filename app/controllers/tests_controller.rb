class TestsController < ApplicationController

  def index
    render json: {'status': "Working"}
  end

end
