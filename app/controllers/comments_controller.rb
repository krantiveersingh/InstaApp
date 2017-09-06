class CommentsController < ApplicationController
  
  def new
    
  end

  def create
  	@post = Post.find(params[:comment][:post_id])
  	@comment = @post.comments.create(find_params)
  	@comment.user_id = current_user.id

  	if @comment.save
  		redirect_to post_path(id: @post.id)
  	else
  		flash[:error]= "Comment failed to create"

   end
   end

   def edit
     @comment
   end



   def show
   end

   def update
     
   end

   def destroy
     @comment = Comment(@comment.id)
     @comment.destroy
   end

  private

  def find_params
  	params[:comment].permit(:comment)
  end
end
