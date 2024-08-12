require "test_helper"

class FlatReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get flat_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get flat_reviews_create_url
    assert_response :success
  end

  test "should get edit" do
    get flat_reviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get flat_reviews_update_url
    assert_response :success
  end
end
