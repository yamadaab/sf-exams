require 'test_helper'

class PostCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_categories_new_url
    assert_response :success
  end

  test "should get create" do
    get post_categories_create_url
    assert_response :success
  end

  test "should get destroy" do
    get post_categories_destroy_url
    assert_response :success
  end

end
