class User < ApplicationRecord
  # nameカラムのバリデーション(空欄の予防)
  validates :name, {presence: true}
  # emailカラムのバリデーション（空欄の予防、重複の予防）
  validates :email, {presence: true,uniqueness: true}
  # passwordカラムのバリデーション（空欄の予防）
  validates :password, {presence: true}

  # 投稿情報を呼び出し
  def posts
    return Post.where(user_id:self.id)
  end
end
