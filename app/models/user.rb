class User < ApplicationRecord
  # nameカラムのバリデーション(空欄の予防)
  validates :name, {presence: true}
  # emailカラムのバリデーション（空欄の予防、重複の予防）
  validates :email, {presence: true,uniqueness: true}
  # passwordカラムのバリデーション（空欄の予防）
  validates :password, {presence: true}
end
