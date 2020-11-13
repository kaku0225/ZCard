class BoardsController < ApplicationController

  
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def create
    clean_params = params.require(:board).permit(:title)
    @board = Board.new(clean_params)

    if @board.save
      redirect_to "/" , notice: '成功新增看板'
    else
      render :new
    end
  end

  def update
    @board = Board.find(params[:id])
    clean_params = params.require(:board).permit(:title)

    if @board.update(clean_params)
    redirect_to root_path, notice:'更新成功'
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to root_path, notice:'看板已刪除'
  end

end