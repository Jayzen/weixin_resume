class StatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_state, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_states, only: [:index]
  before_action :set_tap_photographs, only: [:new, :edit]
  access state: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @state = current_user.states.new
  end

  def edit
  end

  def create
    @state = current_user.states.new(state_params)

    if @state.save
      flash[:success] = "创建成功"
      redirect_to states_path
    else
      render :new
    end
  end
  
  def update
    if @state.update(state_params)
      flash[:success] = "更新成功"
      redirect_to states_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @state.destroy
    flash[:success] = "删除成功"
    redirect_to states_path
  end

  private
    def set_state
      @state = current_user.states.find(params[:id])
    end

    def state_params
      params.require(:state).permit(:name, :content, :pic, :reveal, :weight, :tap_photograph_id)
    end

    def set_states
      @states = current_user.states.page(params[:page])
    end

    def set_tap_photographs
      @tap_photographs = current_user.tap_photographs
    end
end
