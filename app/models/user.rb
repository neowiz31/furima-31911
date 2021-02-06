class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email,
              format: { with: %r{\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z} }
    validates :first_name,
              format: { with: /\A([ぁ-んァ-ン一-龥々]|ー)+\z/ }
    validates :last_name,
              format: { with: /\A([ぁ-んァ-ン一-龥々]|ー)+\z/ }
    validates :first_name_kana,
              format: { with: /\A([ァ-ン]|ー)+\z/ }
    validates :last_name_kana,
              format: { with: /\A([ァ-ン]|ー)+\z/ }
    validates :birth_day
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  has_many :items
  has_many :orders
end
