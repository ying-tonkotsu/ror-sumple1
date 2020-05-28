Rails.application.routes.draw do
# ホーム
  get '/' => "home#top"
# アバウトページ
  get 'about' => "home#about"
# 投稿関係
# 投稿一覧
  get 'posts/index'
# 新規投稿作成
  get 'posts/new' => "posts#new"
# Createアクション
  post 'post/create' => "posts#create"
# 投稿詳細(URLにIDカラムを含める)
# postsコントローラの他のアクションはこれより上に書く
  get 'posts/:id' => "posts#show"
end
