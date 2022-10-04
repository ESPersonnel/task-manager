class UsersController < ApplicationController

    # GET /users
    def index
        render json: User.all, status: :ok
    end

    # GET /users/:id
    def show
        user = User.find_by(id:params[:id])
        if user
            render json: user, status: :ok
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    # POST /users
    def create
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # PATCH /users/{:id}

    # DELETE /users/{:id}

    private

    def user_params
        params.permit(
            :first_name, :last_name, :email, :username, :password, :password_confirmation
        )
    end

end
