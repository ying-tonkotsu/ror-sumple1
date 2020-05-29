class PostsController < ApplicationController
  # 一覧ページ
  def index
    @posts = Post.all.order(created_at: :desc)
    # created_atをもとに新しい順に並び替える
  end
  # 詳細ページ
  # idはDB内でparamsという変数のハッシュ値となっている
  def show
    # idカラムがparams[:id]dである投稿データを代入
    @post = Post.find_by(id:params[:id])
  end
  # 新規作成ページ
  def new
  end
  # 新規投稿を作成
  def create
    #Postインスタンスを作成
    @post = Post.new(content:params[:content])
    # 内容をDBに保存
    @post.save
    # indexページへ転送
    redirect_to("/posts/index")
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
    # 内容をDBに保存
    @post.save
    # indexページに転送
    redirect_to("/posts/index")
  end
  # 投稿を削除
  def destroy
    # URLからIdを取得
    @post = Post.find_by(id:params[:id])
    # DBから削除
    @post.destroy
    # indec¥xページに転送
    redirect_to("/posts/index")
  end
end
