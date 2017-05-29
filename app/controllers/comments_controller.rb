class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @recipe = find_by_id(Recipe)
  end

  def create
    if logged_in?
      comment = Comment.new(comment_params)
      comment.recipe = find_by_id(Recipe)
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

  def edit
    binding.pry
    @comment = find_by_id(Comment)
    @recipe = find_by_id(Recipe)
  end

  def update

  end

  def destroy
    comment = find_by_id(Comment)
    recipe = find_by_id(Recipe)
    comment.delete
    flash[:notice] = "Comment has been deleted"
    redirect_back(fallback_location: root_path)
  end


  private
  def comment_params
     params.require(:comment).permit(:rating, :description)
  end

end
