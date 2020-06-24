class ApplicationController < ActionController::Base
# 全コントローラーに共通のアクション
    before_action :set_current_user
# set_current_userメソッドを定義する
# ログイン中のユーザー
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

# ログインしていない場合
    def authenticate_user
        if @current_user == nil
        flash[:notice] = "ログインが必要です"
        redirect_to("/login")
        end
    end


# ログイン中のユーザーがアクセスできないページ
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
    #ホームに行って欲しい（マイページ的な）
      redirect_to("/posts/index")
    end
  end


end