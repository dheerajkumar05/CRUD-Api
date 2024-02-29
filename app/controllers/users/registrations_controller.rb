class Users::RegistrationsController < Devise::RegistrationsController
    render :json

    private

  def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: {code: 200, message: "Signed in successfully", data: resource}
      }, status: :ok
    else
      render json: {
        status: {message: "User could not be created successfully", errors: resource.errors.full_messages }, status: :unprocessable_entity
      }
    end
  end
end
