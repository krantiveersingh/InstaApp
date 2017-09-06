class PostsController < ApplicationController
  
  before_action :find_post,only: [:show, :edit]
  before_action :authenticate_user!


  def new
  	@post = Post.new
      respond_to do |format|
       format.js{}  
      end
  end

  def about
     @about = User.where(user_id: current_user.id)
  end

  def index
    if user_signed_in?
      @post = Post.new
      @myposts = Post.where(user_id: current_user.id).order('Created_by DESC')
      @others_posts = Post.not.where(user_id: current_user.id)
    else
      render 'sign_in'
    end
  end


  def create
  	@post = Post.create(post_params)

  	if @post.save
       respond_to do |format|
      	format.html { redirect_to @post, notice: 'created successfully!!'}
        format.json { render json:root_url, status: :created,location: @post}
        format.js  
        end
  	else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity}
        format.js
  	end
  end

  def show

  end

  def edit
    
  end

  def update
    respond_to do |format|
    if @post.update(post_params)
      format.html { redirect_to @post, notice: 'updated successfully!!'}
      format.json { render :root_url, status: :ok,location: @post}
      format.js  
    else
      format.html { render :edit }
      format.json { render json: @post.errors, status: :unprocessable_entity}
      format.js
    end
    end 
  end

  private
  	def post_params
  		params.require(:post).permit(:id,:description,:user_id,:image)
  	end

  	def find_post
  		 @post = Post.find(params[:id])
  	end
end
