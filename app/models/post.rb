class Post < ApplicationRecord
    # バリデーション
    # {presence:true}でそのカラムの値の存在するかどうかチェックする
    # 最大文字数を140字に設定
    validates :content, {presence:true,length:{maximum:140}}
end
