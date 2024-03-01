class Users::SessionsController < Devise::SessionsController

  private

  def respond_with(resource, options={})
    render json: {
      status: {code: 200, message: "User signed in sucessfully", data: current_user}
    },status: :ok
  end

  def respond_to_on_destroy
    # first need find to the user and using authorization token that we will recive through the headers next the authorzation define to the rackcors then .split are used the don't need of the bearer text and .first instance of it 
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
     Rails.application.credentials.fetch(:secret_key_base)).first

     current_user = User.find(jwt_payload['sub'])
     # debugger
    if current_user
      render json: { status: 200, message: "Signed out successfully" }, status: :ok
    else
      render json: { status: 401, message: "User has no active session" }, status: :unauthorized
    end
  end
end