module Api
  module V1
    class PhotosController < ApplicationController
before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
   if params[:count].present?
      @photos = Photo.last(params[:count]).reverse
    else
    @photos = Photo.all.order(created_at: :desc)
  end
  data =[]
      @photos.map do|ii|
        
          data<<{
            :photo=>ii,
            :user=>ii.user,
            :comment=>Comment.where(photo_id: ii.id,status: 1),
            :comments=>Comment.where(photo_id: ii.id).count
    }
     end   
  
    render json: data
  
  end

  # GET /photos/1
  # GET /photos/1.json
  def show1
     @photo = Photo.find(params[:id])
       @user = @photo.user
       data = {
        :photo=> @photo,
        :user => @user,
        :comment=>Comment.where(photo_id: params[:id],status: 1).last(5).reverse
        #:comments=>Comment.where(photo_id: params[:id]).count
       }
     render json: data
    
  end

  def allphoto
    data = Photo.photolog(params)
    data = {
      :img=>data
    }
    render json: data
  end

  # GET /photos/new
  def new
    @photo = Photo.new
    render json: @photos
  end

  # GET /photos/1/edit
  def edit
  end
   def accept

     @cmd = Comment.find(params[:format])

     if @cmd.update(status: 1)
      render json: @cmd
     end
  end

  def comment

    @cmd = Comment.create(username: params[:username], comments: params[:comments], photo_id: params[:photo_id], fieldname: params[:fieldname])
    render json: @cmd 
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = session[:user_id]
        

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def comm
    
    @comm = Comment.where(photo_id: params[:photo_id],status: 1)
    render json: @comm
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :title, :content, :user_id)
    end
  end
end
end
