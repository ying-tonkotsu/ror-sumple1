class Post < ApplicationRecord
    # バリデーション
    # {presence:true}でそのカラムの値の存在するかどうかチェックする
    # contentの最大文字数を140字に設定
    validates :content, {presence:true,length:{maximum:140}}
    # user_idのバリデーション
    validates :user_id, {presence:true}

# インスタンスメソッドuserを定義
  def user
    return User.find_by(id: self.user_id)
  end
end
