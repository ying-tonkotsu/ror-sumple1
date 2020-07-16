Rails.application.routes.draw do
#get : DBを変更しないアクション
#post: DBを変更するアクション

# ユーザー関係
# 新規登録入力画面
 get 'signup' => 'users#new'
# 新規登録確定
 post 'users/create' => 'users#create'
# ユーザー一覧
 get 'users/index'
# ユーザー詳細
 get 'users/:id' => "users#show"
#アカウント情報の編集画面
 get 'users/:id/edit' => 'users#edit'
# アカウント情報の更新
 post 'users/:id/update/' => 'users#update'

 # ログイン画面
 get 'login' => 'users#login_form'
 #「get」と「post」では異なるルーティングとして扱われるので問題ない。
 # ログイン処理
 #ログインフォームからデータを送信
 post 'login' => 'users#login'
 # ログアウト処理
 # sessionの値を変更するのでpost 　
 post 'logout' => 'users#logout'


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
# 投稿の削除
  post 'posts/:id/destroy' => 'posts#destroy'


# いいね！機能
  post 'likes/:post_id/create' => 'likes#create'
# いいね！を取り消す
  post 'likes/:post_id/destroy' => 'likes#destroy'

# ホーム
  get '/' => "home#top"
# アバウトページ
  get 'about' => "home#about"

end
