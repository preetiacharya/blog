require 'test_helper'

class FormValidationControllerTest < ActionController::TestCase
  test "should get email" do
    get :email
    assert_response :success
  end

end
