class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all
    # @user = User.find(params[:id])
    # render json: @user.find(user_params(:jokes))
  end

  def show
    render json: find_user
  end

  def create
  end

  def update
    @user = User.find(user_params)
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    render json: User.find(params[:id]).destroy
  end



  private



  def user_params
     params.permit(:id, :name, :password, :bio)
   end

   def find_user
     @user = User.find(params[:id])
   end





end
