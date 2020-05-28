class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def show
    # idはDB内でparamsという変数のハッシュ値となっている
    @id = params[:id]
    # idカラムがparams[:id]dである投稿データを代入
    @post = Post.find_by(id:params[:id])
  end
end
