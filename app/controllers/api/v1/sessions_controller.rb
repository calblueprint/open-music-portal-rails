class Api::V1::SessionsController < Api::V1::BaseController
  include ApplicationHelper
  skip_before_filter :verify_authenticity_token, only: [:login]

  def login
    email = decrypt(params[:email])
    password = decrypt(params[:password])

    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      render json: {judge: user.to_json}
    else
      render json: Response.unauthorized(user)
    end
  end

  private

    def safe_params
      params.require(:user).permit(:email, :password)
    end

end
