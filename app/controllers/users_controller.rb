class UsersController < ApplicationController
    def index
        users = User.all
        if users.empty?
            render json:{
                message: "User not found",
                users:[]
            }, status: :not_found
        else
            render json:{
                message: "Users found",
                users:users
            }, status: :ok
        end
    end
    
    def create
        user = User.create(user_params)
        if user.save
            render json:{
                message:"User Created Successfully",
                user:user
            }, status: :created
        else
            render json:{
                message:"User unable to create",
                error: user.error.full_messages
            }, status: 422
        end
    end

    def update
        user = set_user
        if user.update(user_params)
            render json:{
                message:"User updated succuessfully",
                user:user
            },status: :ok
        else
            render json:{
                message:"User unable to update",
                error:user.error.full_messages
            },status: 422
        end
    end

    def show
        user = set_user
        if user
            render json:{
                message:"User found",
                user:user
            }, status: :ok
        else
            render json:{
                message:"User not found",
                user:[]
            }, status: :not_found
        end
    end

    def destroy
        user = set_user
        if user.delete
            render json:{
                message:"User deleted successfully",
                user:user
            }, status: :ok
        else
            render json:{
                message:"User unable to delete",
                error:user.error.full_messages
            }, status: 422
        end
    end

    def search
        search = params[:search].to_s
        users = User.where("firstName like ? OR lastName like ? OR email like ?", "%#{search}%", "%#{search}%", "%#{search}%")
        if users.empty?
            render json:{
                message: "User not found",
                users:[]
            }, status: :not_found
        else
            render json:{
                message: "Users found",
                users:users
            }, status: :ok
        end
    end

    private
    def set_user
        user = User.find_by(id:params[:id])
        if user
            return user
        end
    end

    def user_params
        params.require(:user).permit(:firstName, :lastName, :email)
    end

end
