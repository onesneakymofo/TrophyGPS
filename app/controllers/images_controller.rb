class ImagesController < ApplicationController
  def new
    @image = Image.new()
  end

  def create
    @image = Image.new(image_params)
    @post = Post.new(image: @image, user: User.first)
    @post.image.imageable = @post
    respond_to do |format|
      if @post.save!
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
