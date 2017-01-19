class PostsController < ApplicationController
  before_action :logged_in_user

  def index
    if params[:word].present?
      @posts = Post.where("message like ?", "%#{params[:word]}%").order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # necessary for validation error message
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.message = params[:message]
    @post.user_id = current_user.id

    if params[:file].present?
      image_file = params[:file]
      time = Time.now
      name = time.to_s + image_file.original_filename

      File.open("#{Rails.public_path}/images/#{name}", 'wb') { |f|
        f.write(image_file.read)
      }
      @post.image = name
    else
      @post.image = "no image"
    end

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
end
