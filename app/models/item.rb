class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :state

  #空の投稿を保存できないようにする
  validates :image, :name, :text, :price, :category, :state, :derivery_type, :prefecture, :duration, presence: true
end
