class PostsController < ApplicationController
  def new
  	#空のモデルをviewに渡す。
  	@post = Post.new
  end

  def create
  	#ストロングパラメータを使用
  	post = Post.new(post_params)
  	#DBへ保存する
  	post.save
  	#トップ画面へリダイレクト
  	redirect_to '/top'
  end

  private
  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
