class Product < ApplicationRecord

  validates :name, presence: true
  attr_accessor :image_url

  def self.scope(params)

    scope = Product

    #per category
    unless params[:category].blank?
      scope = scope.where(category: params[:category])
    end

    #min max
    minimum_params = (params[:minimum].blank? ? 0 : params[:minimum]).to_i * 100
    maximum_params = (params[:maximum].blank? ? 9999999 : params[:maximum]).to_i * 100
    scope = scope.where(price: (minimum_params.to_i)..(maximum_params.to_i))

    #available
    scope = scope.where.not(sold_out: true) if params[:available].to_s == "true"

    #sort_by
    unless params[:sortBy].blank?
      if params[:sortBy] == "price"
        scope = scope.order('price asc')
      end
      if params[:sortBy] == "offer"
        scope = scope.where(under_sale: true).order('sale_percentage desc')
      end
    end

    #pagination
    page_params = params[:page] || 0
    limit_params = 6
    scope = scope.page(page_params).per(limit_params)


    scope
  end

  def image_url
    "/#{category}.jpg"
  end
end
