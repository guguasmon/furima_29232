class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_type
  belongs_to_active_hash :duration
  has_one_attached :image
  belongs_to :user
  has_one    :order

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角で入力してください' }
    validates :category_id
    validates :state_id
    validates :delivery_type_id
    validates :prefecture_id
    validates :duration_id
    with_options numericality: { other_than: 0, message: "を入力してください" } do
      validates :category_id
      validates :state_id
      validates :delivery_type_id
      validates :prefecture_id
      validates :duration_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '適正な価格にしてください' }
  end
end
