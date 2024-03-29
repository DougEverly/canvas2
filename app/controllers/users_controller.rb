require 'net/http'
require 'json'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @roles = Role.all
    
    @tz = fetch_tz Time.now.to_i
    
    logger.debug(params[:roles])
    if params[:roles]
    logger.debug(params[:roles])
    
    roles = params[:roles] #.split(',')
   logger.debug(roles)
   @users = User.distinct.joins(:user_to_roles).joins(:roles).where("roles.id IN (?)", roles)
    else
      @users = User.where(nil)
    end
  end
  
  def fetch_tz(e)
    url = "https://maps.googleapis.com/maps/api/timezone/json?location=37.77492950,-122.41941550&timestamp=#{e.to_i}&sensor=false"
    uri = URI(url)
    res = Net::HTTP::get(uri)
    r = JSON.parse(res)
    t = Time.at(e)
    
    t.getlocal(r["rawOffset"] + r["dstOffset"])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user.to_xml }
    end
  end

  # GET /users/new
  def new
    @user = User.new
    @user.roles.build
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
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
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first, :last)
    end
end
