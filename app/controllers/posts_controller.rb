class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    user = User.find params[:user_id]
    @classroom = user.classroom
    @posts_by_user = Post.where("user_id = #{params[:user_id]}").order("created_at DESC")

    # @posts = Post.all
    @posts_by_month = @posts_by_user.group_by {|post| post.created_at.beginning_of_month}
  end

  def by_year_and_month
    @posts_by_month = Post.all.order("created_at DESC").group_by {|post| post.created_at.beginning_of_month}
    @posts = Post.where("YEAR(created_at) = ? AND MONTH(created_at) = ?", params[:year], params[:month]).order("created_at DESC")
  end
  
  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    post_details = post_params

    if !params["file"].nil?
      req = Cloudinary::Uploader.upload params["file"]
      post_details[:image] = req["url"]
    else
      post_details[:image] = nil
    end

    @post = Post.new( post_details )

    respond_to do |format|
      if @post.save
         @current_user.posts << @post
        format.html { redirect_to posts_user_path(@current_user), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: posts_user_path(@current_user) }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    post_details = post_params

    if !params["file"].nil?
      req = Cloudinary::Uploader.upload(params["file"])
      post_details[:image] = req["url"]
    else
      post_details[:image] = nil
    end

    respond_to do |format|
      if @post.update(post_details)
        format.html { redirect_to posts_user_path(@current_user), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: posts_user_path(@current_user) }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_user_path(@current_user), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
