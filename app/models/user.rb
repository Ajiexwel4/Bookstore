class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
  has_one :picture, as: :imageable
  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy

  mount_uploader :avatar, ImageUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
