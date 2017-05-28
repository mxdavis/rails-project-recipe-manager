class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @recipe = Recipe.find_by(id: params)
  end

  def create
    if logged_in?
      comment = Comment.new(comment_params)
      comment.recipe = Recipe.find_by(id: params[:recipe_id])
      comment.user = current_user
      if comment.save
        redirect_to recipe_path(comment.recipe), notice: "Your comment was submitted successfully"
      else
        redirect_to recipe_path(comment.recipe)
      end  
    else 
      redirect_to login_path, alert: "You must be logged in to comment"
    end
  end


  private
  def comment_params
     params.require(:comment).permit(:rating, :description)
  end

end
