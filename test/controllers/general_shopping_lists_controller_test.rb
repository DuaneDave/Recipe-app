require 'test_helper'

class GeneralShoppingListsControllerTest < ActionDispatch::IntegrationTest
  test 'should get general' do
    get general_shopping_lists_general_url
    assert_response :success
  end
end
