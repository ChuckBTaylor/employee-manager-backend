class Api::V1::ProductsController < ApplicationController

  def index
    products = Company.find(params[:company_id]).products
    render json: products
  end

  def create
    product_info = params['product']
    product = Product.new(name: product_info['name'])
    if Company.find(params['company_id']).products << product
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: 422
    end
  end

  def update
    product_info = params['product']
    product = Product.find(params['id'])
    if product.update(name: product_info['name'])
      render json: product
    else
      render {errors: product.errors.full_messages}, status: 422
    end
  end

  def destroy
    Product.destroy(params['product']['id'])
    render json: Product.all
  end


end
