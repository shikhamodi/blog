class BlogsController < ApplicationController
	before_action :set_blog, only: [:show, :edit, :update, :destroy]

	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end

	def show
	end

	def edit
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
			redirect_to blog_path(@blog)
		else
			render :new
		end
	end

	def update
		if @blog.update(blog_params)
			redirect_to blog_path(@blog)
		else
			render :edit
		end
	end

	def destroy
		@blog.destroy
		redirect_to blogs_path
	end

	private
	def blog_params
		params.require(:blog).permit(:title, :discription,:image, {avatars: []}, :youtube_url)
	end

	def set_blog
		@blog = Blog.friendly.find(params[:id])
	end
end
