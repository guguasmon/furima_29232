class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  with_options presence: true do
    validates :name
    validates :email, uniqueness: { case_sensitive: true }, format: { with: /\A.+@.+\z/, message: "@マークを入れてください"}
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "半角英数字混合です"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角（漢字・ひらがな・カタカナ）で入力"}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角（漢字・ひらがな・カタカナ）で入力"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）で入力"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）で入力"}
    validates :birth_date
  end
end
