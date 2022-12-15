require 'test_helper'

class PublicRecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get public' do
    get public_recipes_public_url
    assert_response :success
  end
end
