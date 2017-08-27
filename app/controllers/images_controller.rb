class ImagesController < ApplicationController
  layout 'authenticated_application'
  def new
    @image = Image.new()
  end

  def create
    @post = nil
    @image = Image.new(image_params)
    unless(@image.image_data.blank?)
      @post = Post.new(image: @image, user: current_user)
      @post.image.imageable = @post
    else
      @image.errors.add(:image, "Is Required")
    end
    respond_to do |format|
      if @post && @post.save(validate: false)
        format.html { redirect_to edit_post_path(@post), notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def image_params
      params.fetch(:image).permit!
    end

end
