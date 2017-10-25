class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user, :only => [:index, :new, :create, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
  @cmd = Comment.all.order(created_at: :desc)
  end

  # GET /photos/1
  # GET /photos/1.json
  def show

  end

  # GET /photos/new
  def new
    @cmd = Comment.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @cmd = Comment.new(comment_params)
    @cmd.user_id = session[:user_id]


    respond_to do |format|
      if @cmd.save
        format.html { redirect_to @cmd, notice: 'comment was successfully created.' }
        format.json { render :show, status: :created, location: @cmd }
      else
        format.html { render :new }
        format.json { render json: @cmd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @cmd.update(comment_params)
        format.html { redirect_to @cmd, notice: 'comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @cmd }
      else
        format.html { render :edit }
        format.json { render json: @cmd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @cmd.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def command
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @cmd = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:username, :comments, :status, :photo_id)
    end
end
