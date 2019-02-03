class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items


  def add_order_items(current_cart)
    current_cart.items.each do |item|
      self.order_items.build(
        product_id: item.product.id,
        quantity: item.quantity, 
        price: item.product.price 
      )
    end
  end

end
