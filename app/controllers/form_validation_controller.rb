class FormValidationController < ApplicationController
  def email
    @user = User.find_by(email: params[:email_id])
  end
end
