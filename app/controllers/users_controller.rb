class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def new
    # necessary for validation error message
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    if params[:file].present?
      image_file = params[:file]
      time = Time.now
      name = time.to_s + image_file.original_filename

      File.open("#{Rails.public_path}/images/#{name}", 'wb') { |f|
        f.write(image_file.read)
      }

      @user.image = name
    end

    if @user.save
      login @user
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    update_params = {}

    if params[:name].present?
      update_params[:name] = params[:name]
    end
    if params[:email].present?
      update_params[:email] = params[:email]
    end
    if params[:password].present?
      update_params[:password] = params[:password]
    end
    if params[:file].present?
      old_image_file = "#{Rails.public_path}/images/#{@user.image}"

      image_file = params[:file]
      time = Time.now
      name = time.to_s + image_file.original_filename
      update_params[:image] = name
    end

    if update_params.empty?
      render 'edit'
    elsif @user.update(update_params)
      if params[:file].present?
        File.open("#{Rails.public_path}/images/#{name}", 'wb') { |f|
          f.write(image_file.read)
        }
        File.delete(old_image_file)
      end
      login @user
      redirect_to posts_path
    else
      render 'edit'
    end
  end
end
