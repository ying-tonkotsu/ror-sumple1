class LikesController < ApplicationController
  # before_actionに「:authenticate_user」を追加
  #ゲストは弾く(ログインユーザーのみいいね！ができる！)
  before_action :authenticate_user

  # いいね！する
  def create
    @like = Like.new(
        # ログイン中のみいいね可能
        # ログイン中のユーザーIDを組み込む
        user_id: @current_user.id,
        # コンマで区切る
        #該当する投稿をURLから取得
        post_id: params[:post_id]
    )
    # データを保存
    @like.save
    # postのshowページへ
    # ダブルクォーテーションじゃないと動かないので注意
    redirect_to("/posts/#{params[:post_id]}")
  end

end