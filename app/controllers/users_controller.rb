class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #debugger
  end

  def new
    @user = User.new
    #debugger
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
    #if @user.false  #演習
      flash[:success] = "Welcome to the Sample App!"
      # 保存の成功をここで扱う。
      #redirect_to @user 下と同じ意味
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
  
end
