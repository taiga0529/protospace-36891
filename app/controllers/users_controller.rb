class UsersController < ApplicationController

  def show
    @user = User.name  
    #user = User.find(params[:id]) #karentouser 4 5
    @users=User.all
    #@prototype =user.id
    @user=User.find(params[:id])
    @prototype=Prototype.all
  end

end
