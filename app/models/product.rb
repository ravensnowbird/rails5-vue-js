class Product < ApplicationRecord
  attr_accessor :image_url


  def image_url
    "/assets/#{category}.jpg"
  end
end
