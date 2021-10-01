class PrototypesController < ApplicationController
  before_action :authenticate_user!,only: [:create,:update,:new,:edit]
  before_action :move_to_index, only: [:edit]

  

def index
  @prototypes= Prototype.all
end

def new
  @prototype = Prototype.new
end

def edit
  @prototype=Prototype.find(params[:id])
  #redirect_to root_path unless current_user.id == @buy_item.user_id
end

def update
      prototype=Prototype.find(params[:id])
  if  prototype.update(prototype_params)
     redirect_to prototype_path(@prototype)
  else
    render :edit
 end
end

def show
  @prototype=Prototype.find(params[:id])
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user)
end

def destroy
  prototype = Prototype.find(params[:id])
  prototype.destroy
  redirect_to root_path
end

def create
   @prototype=Prototype.create(prototype_params)
  #prototype=Prototype.new(prototype_params)
  if @prototype.save
    redirect_to root_path 
  else
     render :new
  end
 end
end

private
def prototype_params
params.require(:prototype).permit(:title, :catch_copy, :concept,:image) .merge(user_id: current_user.id) # 取得したいキーを指定する
end

def set_prototype
  @prototype = Prototype.find(params[:user_id])
end

def move_to_index
  unless  current_user == @prototype  #プロトタイプのユーザーID＝現在ログインしているユーザーID
    redirect_to action: :index
  end
end

