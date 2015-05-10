class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/username
  # GET /users/username.json
  def show
    puts "this is @user.username: ", @user.username
    respond_to do |format|
      format.html #{render json: @user}
      format.json { render json: @user, root: false}
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    puts "\n", params, "\n","\n"
    puts user_params["username"], "\n", user_params, "\n"
    #puts "\n", "\n", "this is the params-id", params[:id], "immediately after"


    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
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
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      puts "\n","\n"," set_user method params[:id]", params[:id], "\n","params[pas]","\n"
      puts params[:password]

      if params[:password] != User.find_by(username: params[:id]).password
        render :text => "{\"result\":\"fail\"}"
      else 
        @user = User.find_by username: params[:id]
      end 

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:id, :username, :password, :phonenumber, :latitude, :longitude)
    end

end
