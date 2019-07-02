class HotWordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hot_word, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_hot_words, only: [:index]
  access hot_word: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @hot_word = current_user.hot_words.new
  end

  def edit
  end

  def create
    @hot_word = current_user.hot_words.new(hot_word_params)

    if @hot_word.save
      flash[:success] = "创建成功"
      redirect_to hot_words_path
    else
      render :new
    end
  end
  
  def update
    if @hot_word.update(hot_word_params)
      flash[:success] = "更新成功"
      redirect_to hot_words_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @hot_word.destroy
    flash[:success] = "删除成功"
    redirect_to hot_words_path
  end

  private
    def set_hot_word
      @hot_word = current_user.hot_words.find(params[:id])
    end

    def hot_word_params
      params.require(:hot_word).permit(:name, :reveal, :order)
    end

    def set_hot_words
      @hot_words = current_user.hot_words.page(params[:page])
    end
end
