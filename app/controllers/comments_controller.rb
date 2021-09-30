class CommentsController < ApplicationController

  def create
    #comment = Comment.new
    comment=Comment.create(comment_params)
    if comment.save
      #redirect_to    #"/prototypes/#{comment.prototype.id}"
      redirect_to prototype_path (comment.prototype_id)
      #(@comment.user_id,@comment.prototype_id)    
     else
       render :show  #render "ディレクトリ名/ファイル名"
  end
end


   private
   def comment_params
    #params.require(:comment).permit(:content).merge(user_id: current_user.id :prototype_id params[:prototype_id]) # 取得したいキーを指定する
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
   end
  end