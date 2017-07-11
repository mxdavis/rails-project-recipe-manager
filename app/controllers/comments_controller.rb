class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def show
    comment = Comment.find_by(user: current_user, recipe: find_by_recipe_id)
    respond_to do |f|        
      f.json {render json: comment}       
    end 
  end

  def create
    if logged_in?
      comment = Comment.new(comment_params)
      comment.recipe = find_by_recipe_id
      comment.user = current_user
      if comment.save
        respond_to do |f|     
          f.json {render json: comment}        
        end 
      end
    else 
      redirect_to login_path, alert: "You must be logged in to comment"
    end
  end

  def edit
    @comment = find_by_id(Comment)
  end

  def update
    comment = find_by_id(Comment)
    comment.update(comment_params)
    redirect_to recipe_path(comment.recipe), notice: "Your comment has been updated"
  end

  def destroy
    id = params["id"].to_i
    comment = Comment.find_by(id: id)
    comment.delete
    flash[:notice] = "Comment has been deleted"
  end


  private
  def comment_params
     params.require(:comment).permit(:rating, :description)
  end




end
