class PrototypesController < ApplicationController
  before_action :authenticate_user!,only: [:create,:update]
  before_action :move_to_index, except: [:index, :show]

def index
  @prototypes= Prototype.all
end

def new
  @prototype = Prototype.new
end

def edit
  @prototype=Prototype.find(params[:id])
end

def update
  if prototype=Prototype.find(params[:id])
     prototype.update(prototype_params)
     redirect_to root_path
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

private
def prototype_params
params.require(:prototype).permit(:title, :catch_copy, :concept,:image) .merge(user_id: current_user.id) # 取得したいキーを指定する
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end

end
