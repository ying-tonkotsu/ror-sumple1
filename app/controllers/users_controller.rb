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
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "default_image_name.png"
    )

    # 入力されたデータが保存できたら
    if @user.save
      # 新規登録時にログイン状態にする
      session[:user_id] = @user.id
      # サクセスメッセージを追加して詳細ページへ転送
      flash[:notice] = "Welcome! #{@user.name}"
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

    # 画像が入力されていたら
    if params[:image]
      # ファイル名をユーザーIDに指定
     @user.image_name = "#{@user.id}.jpg"
      #入力されたファイルを格納
      image = params[:image]
      # public/user_imagesフォルダに画像データを格納
     File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end

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

  # ログイン画面
  def login_form

  end

  # ログイン処理
  def login
    # 入力された値と一致するものをfind_byで特定し代入（該当するユーザーを特定）
    @user = User.find_by(email: params[:email], password: params[:password])

    # ログイン成功(@userが存在する)
    if @user
      # 特定したユーザーのIDをブラウザに記憶させる(ログインユーザーの情報を保持)
      session[:user_id] = @user.id
      # サクセスメッセージ
      flash[:notice] = "Welcomeback,#{@user.name}!"
      # 投稿一覧へ転送
      redirect_to("/posts/index")
    # ログイン失敗
    else
      # エラーメッセージ
      @error_message = "！Wrong email address or password"
      # 初期値
      @email = params[:email]
      @password = params[:password]
      # やり直し
      render("users/login_form")
    end
  end

  # ログアウト処理
  def logout
    # セッションIDを削除
    session[:user_id] = nil
    # メッセージ
    flash[:notice] = "goodbye!"
    # ログインページへ転送
    redirect_to("/login")
  end

end
