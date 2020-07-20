class Api::V1::UsersController < ApplicationController
  
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.find_or_create_by(user_params)
    
    render json: user
    # user = User.new(user_params)
    #   if user.save
      #   render json: user
      # else
      #   render error: {error: "Unable to create User."}, status:400
      # end
  end

  # def update
    
  #   user = User.find(params[:id])
  #     if user
  #       user.update(user_params)
  #       render json: {message: ‘User successfully updated’}, status: 200
  #     else
  #       render json: {error: ‘Unable to update User’}, status:400
  #     end
  # end

  # def destroy
  #   # don't need a destroy user method
  #   user = User.find(params[:id])
  #   if user
  #     user.destroy
  #     render json: {message: ‘User successfully deleted’}, status: 200
  #   else
  #     render json: {error: ‘Unable to delete User’}, status: 400
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end


