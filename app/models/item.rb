class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category

  #空の投稿を保存できないようにする
  validates :image, :name, :text, :price, :category, :state, :derivery_type, :prefecture, :duration, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1 } 
end
