class Api::V1::ProductsController < ApplicationController

  def index
    products = Company.find(params[:company_id]).products
    render json: products
  end


end
