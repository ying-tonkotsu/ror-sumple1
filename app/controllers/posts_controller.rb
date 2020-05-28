class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def show
    # idはDB内でparamsという変数のハッシュ値となっている
    @id = params[:id]
  end
end
