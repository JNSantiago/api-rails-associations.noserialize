class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user, include: [:kind, :phones, :address]
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, include: [:kind, :phones, :address], status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, include: [:kind, :phones, :address]
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :kind_id, phones_attributes: [:id, :number, :_destroy],
        address_attributes: [:id, :street, :city])
    end
end
