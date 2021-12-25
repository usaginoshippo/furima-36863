class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  validates :image, presence: true
  validates :item_name,        presence: true
  validates :item_explanation, presence: true
  validates :price,            presence: true
  validates :price,            numericality: true,
                               inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  validates :category_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_cost_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_day_id,          numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :ship_day
end
