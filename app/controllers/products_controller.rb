class ProductsController < ApplicationController
  before_action :authenticate_request!, except: [ :index, :show ]
  before_action :authorization_admin!, only: [ :create, :update, :destroy ]

  def index
    render json: products
  end

  def create
    product.assign_attributes(product_params)

    if product.valid?
      product.save()

      render json: product
    else
      render_unprocessable_entity(product.errors)
    end
  end

  def update
    product.assign_attributes(product_params)

    if product.valid?
      product.save()

      render json: product
    else
      render_unprocessable_entity(product.errors)
    end
  end

  def destroy
    render_not_found if product.nil?

    render_no_content if product.destroy
  end

  protected

  def search
    @search ||= Product.ransack(params[:q])
  end

  def products
    @products ||= search.result.page(params[:page])
  end

  def product
    @product ||=
      case
      when ["create"].include?(action_name)
         Product.new
      else
        Product.find_by(uuid: params[:id])
      end
  end

  def product_params
    params[:product] ? params.require(:product).permit(:sku, :name, :price) : {}
  end
end
