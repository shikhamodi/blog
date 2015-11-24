class BlogsController < ApplicationController
	before_action :set_blog, only: [:show, :edit, :update, :destroy]

	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
		@post_attachment = @blog.post_attachments.build
	end

	def show
		@post_attachments = @blog.post_attachments.all
	end

	def edit
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
			params[:post_attachments]['avatar'].each do |a|
          @post_attachment = @blog.post_attachments.create!(:avatar => a)
      end
       redirect_to blog_path(@blog)
     else
       render action: 'new'
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
		params.require(:blog).permit(:title, :discription,:image, {avatars: []}, :youtube_url,  post_attachments_attributes: [:id, :blog_id, :avatar])
	end

	def set_blog
		@blog = Blog.friendly.find(params[:id])
	end
end
