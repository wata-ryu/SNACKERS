class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  #Bootstrap の flash messageを使えるようにキーを許可する
  add_flash_types :success, :info, :warning, :danger

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      #更新成功のflash message
      flash[:notice] = "投稿が成功しました！"
      redirect_to public_post_path(@post)
    else
      render :new
    end
  end

  def index
    @genres = Genre.all
    #ジャンル検索機能を使用する場合
    if params[:name].present?
      @genre = Genre.find(params[:name])
      #ジャンル検索投稿一覧（ジャンルでの絞り込み + 公開設定した投稿のみ表示 + 最新を上に表示 + kaminariでのページネーション）
      @posts = @genre.posts.released.order("created_at DESC").page(params[:page])
    else
      #全体投稿一覧（公開設定した投稿のみ表示 + 最新を上に表示 + kaminariでのページネーション）
      @posts = Post.released.order("created_at DESC").page(params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user.id)
    @comment = Comment.new
    #コメント機能についての定義（最新を上に表示）
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
     if @post.user == current_user
      @post.update(post_params)
      #更新成功のflash message
      flash[:notice] = "投稿内容が更新されました！"
      redirect_to public_post_path(@post)
     else
        render:edit
     end
  end

  def destroy
    #投稿削除後、マイページへ
    @post = Post.find(params[:id])
    if @post.user == current_user
     @post.destroy
     redirect_to public_user_path(current_user)
    end
  end

  private
  #ストロングパラメータ
  def post_params
    #idsは配列のため、genre_ids: []のような記述になる
    params.require(:post).permit(:title, :alcohol, :summary, :ingredient, :cook, :image, :release, genre_ids: [] )
  end
end
