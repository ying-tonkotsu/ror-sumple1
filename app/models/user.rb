class User < ApplicationRecord
  # nameカラムに関するバリデーション
　#空欄の予防
  validates :name, {presence: true}
  # emailカラムに関するバリデーション
　#空欄の予防、重複の予防
  validates :email, {presence: true,uniqueness: true}
end
