class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :address
  belongs_to :provider
  belongs_to :product

  validates_presence_of :customer_id, message: "O cliente não pode ficar em branco"
  validates_presence_of :amount, message: "A quantidade não pode ficar em branco"
  validates_presence_of :unit_price, message: "O preço unitário não pode ficar em branco"
  validates_presence_of :address_id, message: "O endereço não pode ficar em branco"
  validates_presence_of :provider_id, message: "O fornecedor não pode ficar em branco"
  validates_presence_of :product_id, message: "O produto não pode ficar em branco"
end
