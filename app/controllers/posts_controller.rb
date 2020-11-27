class PostsController < ApplicationController
  before_action :set_board, only: [:new, :create]
  before_action :session_required, only: [:create, :edit, :update]
  before_action :save_post, only: [:show]


  def show
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(post_params)
    # @post.board = @board
    # @post.user = current_user

    @post = current_user.posts.new(post_params)
    @post.board = @board


    if @post.save
      redirect_to boards_path(@board), notice:'新增文章成功'
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: '文章更新成功'
    else
      redirect_to :edit
    end
  end


  

  private
  def set_board
    @board = Board.find(params[:board_id])
  end


  def post_params
    params.require(:post).permit(:title, :content)
  end

  def save_post
    @post = Post.find(params[:id])
  end
end