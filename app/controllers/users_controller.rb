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

  # アカウント作成ページ
  def new
    # インスタンスを格納
    @user = User.new
  end

  # 新規アカウント情報を保存
  def create
    # 入力されたデータを取得
    @user = User.new(id: params[:id], name: params[:name], email: params[:email])
    # 入力されたデータが保存できたら
    if @user.save
      # サクセスメッセージを追加して詳細ページへ転送
      flash[:notice] = "welcome!"
      redirect_to("/users/#{@user.id}")
    else #保存できなかったらnewアクションを介さずに入力画面へ戻す
      render("users/new")
    end
  end

  # アカウント情報の編集
  def edit
    # URLからIDを取得
    @user = User.find_by(id: params[:id])
  end

  # アカウント情報の更新
  def update
    # URLからIDを取得し、ユーザー情報を格納
    @user = User.find_by(id: params[:id])
    # 入力されたデータを格納
    @user.name = params[:name]
    @user.email = params[:email]
    # データを更新
    if @user.save
      #保存できたら、サクセスメッセージを表示してユーザー詳細ページへ転送
      flash[:notice] = "edit successful!"
      redirect_to("/users/#{@user.id}")
    else
      # 失敗した場合は入力画面に戻す
      render("users/edit")
    end
  end

end
