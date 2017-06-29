class UserToRolesController < ApplicationController
  before_action :set_user_to_role, only: [:show, :edit, :update, :destroy]

  # GET /user_to_roles
  # GET /user_to_roles.json
  def index
    @user_to_roles = UserToRole.all
    @users = Hash.new { |h, k| h[k] = Array.new}
    UserToRole.joins(:user, :role).map do |row|
      @users[row.user] << row.role.name
    end
  end

  # GET /user_to_roles/1
  # GET /user_to_roles/1.json
  def show
  end

  # GET /user_to_roles/new
  def new
    @user_to_role = UserToRole.new
  end

  # GET /user_to_roles/1/edit
  def edit
  end

  # POST /user_to_roles
  # POST /user_to_roles.json
  def create
    @user_to_role = UserToRole.new(user_to_role_params)

    respond_to do |format|
      if @user_to_role.save
        format.html { redirect_to @user_to_role, notice: 'User to role was successfully created.' }
        format.json { render :show, status: :created, location: @user_to_role }
      else
        format.html { render :new }
        format.json { render json: @user_to_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_to_roles/1
  # PATCH/PUT /user_to_roles/1.json
  def update
    respond_to do |format|
      if @user_to_role.update(user_to_role_params)
        format.html { redirect_to @user_to_role, notice: 'User to role was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_to_role }
      else
        format.html { render :edit }
        format.json { render json: @user_to_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_to_roles/1
  # DELETE /user_to_roles/1.json
  def destroy
    @user_to_role.destroy
    respond_to do |format|
      format.html { redirect_to user_to_roles_url, notice: 'User to role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_to_role
      @user_to_role = UserToRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_to_role_params
      params.require(:user_to_role).permit(:user_id, :role_id)
    end
end
