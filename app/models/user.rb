class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: { case_sensitive: false }, on: :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, on: :create
  VALID_IMAGE_REGEX = /.*(jpeg|jpg|gif|png)\Z/
  validates :image, presence: true, format: { with: VALID_IMAGE_REGEX }, on: :create

  validates :name, uniqueness: { case_sensitive: false }, on: :update
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, on: :update
  VALID_IMAGE_REGEX = /.*(jpeg|jpg|gif|png)\Z/
  validates :image, format: { with: VALID_IMAGE_REGEX }, on: :update

  validates :password, length: {minimum: 4}, allow_blank: true
end
