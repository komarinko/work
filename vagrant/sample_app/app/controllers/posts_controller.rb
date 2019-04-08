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
    #redirect_to '/top'
    redirect_to post_path(post.id) # 詳細画面へリダイレクト
  end

#投稿全て取り出し
#viewに表示させるなら@がいる
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  private
  def post_params
  	params.require(:post).permit(:title, :body, :image)
  end
end
