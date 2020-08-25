class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_type
  belongs_to_active_hash :duration
  has_one_attached :image
  belongs_to :user

  # 空の投稿を保存できないようにする
  # validates :image, :name, :text, :price, :category_id, :state_id, :delivery_type_id, :prefecture_id, :duration_id, presence: true
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :category_id
    validates :state_id
    validates :delivery_type_id
    validates :prefecture_id
    validates :duration_id
    #リストの選択が「--」の時は保存できないようにする
    with_options numericality: { other_than: 0, message: "can't be blank"  }  do
    validates :category_id
    validates :state_id
    validates :delivery_type_id
    validates :prefecture_id
    validates :duration_id
    end 
    # 「値段」の金額範囲に関するバリデーション
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end
end
