class PostsController < ApplicationController

  before_action:authenticate_user

  # 一覧ページ
  def index
    @posts = Post.all.order(created_at: :desc)
    # descでcreated_atをもとに新しい順に並び替える

  end

  # 詳細ページ
  # idはDB内でparamsという変数のハッシュ値となっている
  def show
    # idカラムがparams[:id]dである投稿データを代入
    @post = Post.find_by(id:params[:id])
    # ユーザー情報をPostsテーブル内のuser_idカラムから特定
    # インスタンスメゾットからユーザー情報を戻す
    @user = @post.user
  end

  # 新規作成ページ
  def new
    # Postインスタンスを追加しバリデーションを有効にする
    @post = Post.new
  end

    # 新規投稿を作成
  def create
    #Postインスタンスを作成
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )
    # 内容をDBに保存
    if @post.save
     # 保存できたら、通知をつけてindexページへ転送
      flash[:notice] = "post created"
      redirect_to("/posts/index")
    else
      # バリデーションエラーにひっかかった場合、newアクションを介さない（入力内容を保持）
      render("posts/new")
    end
  end

  # 投稿編集ページ
  def edit
    @post = Post.find_by(id:params[:id])
  end

  # 編集した投稿を更新
  def update
    # URLからIDを取得
    @post = Post.find_by(id:params[:id])
    # 入力された情報をcontentに上書き
    @post.content = params[:content]
    # バリデーションに引っかからず内容をDBに保存できたら
    if @post.save
    # フラッシュを表示する
    flash[:notice] = "post edited"
    # indexページに転送する
      redirect_to("/posts/index")
    # バリデーションに引っかかったりで保存できなければ
    else
    # 編集ページに転送（やり直しさせる）
      # renderメソッドで直前の投稿を表示させる
      render("posts/edit")
    end

  end

  # 投稿を削除
  def destroy
    # URLからIdを取得
    @post = Post.find_by(id:params[:id])
    # DBから削除
    @post.destroy
    # 通知を表示
    flash[:notice] = "post deleted"
    # indexページに転送
    redirect_to("/posts/index")
  end

end
