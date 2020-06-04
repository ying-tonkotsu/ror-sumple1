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

  def new
    # インスタンスを格納
    @user = User.new
  end

  def create
    # 入力されたデータを取得
    @user = User.new(id: params[:id], name: params[:name], email: params[:email])
    # 入力されたデータが保存できたら
    if @user.save
      # サクセスメッセージを追加して詳細ページへ転送
      flash[:notice] = "welcome!"
      redirect_to("/users/#{@user.id}")
    else #保存できなかったらnewアクションを介さずに入力画面へ戻す
      render("users/new.html.erb")
    end
  end
end
