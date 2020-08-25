class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  with_options presence: true do
    validates :name
    validates :email, uniqueness: { case_sensitive: true }, format: { with: /\A.+@.+\z/}
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Password Include both letters and numbers"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "full-width characters."}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "full-width characters."}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "full-width katakana characters."}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "full-width katakana characters."}
    validates :birth_date
  end
end
