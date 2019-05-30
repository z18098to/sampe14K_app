#class AccountActivationsController < ApplicationController
#
#  def edit
#    user = User.find_by(email: params[:email])
#    if user && !user.activated? && user.authenticated?(:activation, params[:id])
#      user.update_attribute(:activated,    true)
#      user.update_attribute(:activated_at, Time.zone.now)
#      log_in user
#      flash[:success] = "Account activated!"
#      redirect_to user
#    else
#      flash[:danger] = "Invalid activation link"
#      redirect_to root_url
#    end
#  end
#end

#以下　11.3 上はコメントアウト
class AccountActivationsController < ApplicationController

  def edit #11.3
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end