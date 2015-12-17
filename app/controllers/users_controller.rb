class UsersController < ApplicationController
  before_action :check_if_logged_in, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.order(:id, :created_at).reverse
  end

  # GET /users/1
  # GET /users/1.json
  def show
#    @user = @current_user
    @user = User.find params[:id]
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if @current_user.role == 'admin' && params[:id].present?
      @user = User.find params[:id]
    else
      @user = @current_user
    end
  end

  # POST /users
  # POST /users.json
  def create

    user_details = user_params

    if !params["file"].nil?
      req = Cloudinary::Uploader.upload params["file"]
      user_details[:image] = req["url"]
    else
      user_details[:image] = nil
    end

    @user = User.new( user_details )

    @user.password = @user.password_confirmation = '' unless !@user.password.nil?
    @user.password_digest = 'admin-can-set-this-later'

    respond_to do |format|
      if @user.save
        UserMailer.signup_confirmation( @user ).deliver unless @current_user.present?
        UserMailer.new_user_notification( @user ).deliver unless @current_user.present?
        format.html { redirect_to user_path(@user), notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: user_path(@user) }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update    
    @user = User.find params[:id]
    @user = @current_user if @user.nil?

    user_details = user_params
    
    if !params["file"].nil?
      req = Cloudinary::Uploader.upload params["file"]
      user_details[:image] = req["url"]
    else
      user_details[:image] = nil
    end

    respond_to do |format|
      if @user.update(user_details)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find params[:id]
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone_no, :email, :role, :student_name, :classroom, :password, :password_confirmation )
    end

    def check_if_logged_in
      redirect_to user_path unless @current_user.present?
    end

end
