class CommentsController < ApplicationController
	before_action :set_blog, only: [:index, :new, :show, :edit, :create, :update, :destroy]

	def index
		@comment = @blog.comments
		respond_to do |format|
      format.html 
      format.js
    end
	end

	def new
		@comment = @blog.comment.new
	end

	def show
	end

	def edit
	end

	def create
		@comment = @blog.comments.build(comment_params)
		if @comment.save
			redirect_to blog_path(@blog)
		else
			render :new
		end
	end

	def update
		if @comment.update(comment_params)
			redirect_to blog_path(@blog)
		else
			render :edit
		end
	end

	def destroy
		@comment.destroy
		redirect_to blog_path(@blog)
	end

	private
	def comment_params
		params.require(:comment).permit(:comment, :blog_id)
	end

	def set_blog
		@blog = Blog.friendly.find(params[:blog_id])
	end
end
