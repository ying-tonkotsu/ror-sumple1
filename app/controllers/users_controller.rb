class UsersController < ApplicationController
  # ユーザー一覧ページ
  def index
    # ユーザーデータを全件取得
   @users = User.all
  end

  # ユーザー詳細ページ
  def show
    # idを特定
    @user = User.find_by(id: params[:id])
  end
end
