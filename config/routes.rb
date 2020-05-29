Rails.application.routes.draw do

# 投稿関係
# 投稿一覧
  get 'posts/index'
# 新規投稿作成
  get 'posts/new' => "posts#new"
# 投稿詳細(URLにIDカラムを含める)
# postsコントローラの他のアクションはこれより上に書く
  get 'posts/:id' => "posts#show"
  # Createアクション
  post 'posts/create' => "posts#create"
# 投稿の編集
  get 'posts/:id/edit' => "posts#edit"
# 編集した投稿を更新
  post 'posts/:id/update' =>'posts#update'

# ホーム
  get '/' => "home#top"
# アバウトページ
  get 'about' => "home#about"

end
