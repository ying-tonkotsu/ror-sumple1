class PostsController < ApplicationController
  # 一覧ページ
  def index
    @posts = Post.all
  end
  # 詳細ページ
  def show
    # idはDB内でparamsという変数のハッシュ値となっている
    @id = params[:id]
    # idカラムがparams[:id]dである投稿データを代入
    @post = Post.find_by(id:@id)
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
end
