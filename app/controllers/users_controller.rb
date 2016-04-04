class UsersController < ApplicationController
  # Allows a user to sign up to the system 
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users - displays all users. This page is hidden from users 
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new - shows the new user page and form
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users - this is the method that creates a new user and signs them in 
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1 - updates a user account. Not used in system yet. 
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1 - deletes a user from the system. Not used in system yet
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through. parameters entered when signing up 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
