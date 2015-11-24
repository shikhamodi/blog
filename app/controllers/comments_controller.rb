class CommentsController < ApplicationController
	before_action :set_blog, only: [:index, :new, :show, :edit, :create, :update, :destroy]
	 
	def index
		@comment = @blog.comments
		respond_to do |format|
			if @comment.save
				format.html {redirect_to blog_path(@blog)} 
      	format.js {redirect_to blog_path(@blog)}
   		else
      	format.html { render :action => 'new' }
      	format.js { render :action => 'new' }
    	end
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
		respond_to do |format|
			if @comment.save
				format.html 
      	format.js
   		else
      	format.html { render :action => 'new' }
      	format.js { render :action => 'new' }
    	end
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
