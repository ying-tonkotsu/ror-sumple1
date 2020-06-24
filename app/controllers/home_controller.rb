class HomeController < ApplicationController
  before_action :authenticate_user
# アクションという（TOPメゾット）
  def top
  end
  # aboutpage add
  def about
  end
end
