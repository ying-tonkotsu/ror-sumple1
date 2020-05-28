Rails.application.routes.draw do
# ホーム
  get '/' => "home#top"
# アバウトページ
  get 'about' => "home#about"
# 投稿関係
# 投稿一覧
  get 'posts/index'
# 投稿詳細(URLにIDカラムを含める)
  get 'posts/:id' => "posts#show"
end
