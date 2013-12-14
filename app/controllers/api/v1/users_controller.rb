class Api::V1::UsersController < Api::V1:BaseController

  def index
    @users = User.all
    render json: {users: User.to_json(@users)}
  end
end
