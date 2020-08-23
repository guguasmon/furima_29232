class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_type
  belongs_to_active_hash :duration
  has_one_attached :image
  belongs_to :user

  #空の投稿を保存できないようにする
  validates :image, :name, :text, :price, :category_id, :state_id, :derivery_type_id, :prefecture_id, :duration_id, presence: true
end
