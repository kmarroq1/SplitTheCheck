require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    @restaurant = restaurants(:one)
    @votes = votes(:one)
    @comment = comments(:one)
    @favorite = favorites(:one)
  end

  test 'add comment to restaurant' do
    sign_in @user
    assert_difference 'Comment.count', 1 do
      post restaurants_add_comment_url(@restaurant), params: {comment: {comment: @comment.comment}}
    end
  end

  test "should search by name" do
    sign_in @user
    get '/search?q=Name'
    assert_response :success
  end

  test "should search by location" do
    sign_in @user
    get '/search?q=Location'
    assert_response :success
  end

  test "should get index" do
    sign_in @user
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    sign_in @user
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { location: @restaurant.location, name: @restaurant.name, noSplitVote: @restaurant.noSplitVote, splitVote: @restaurant.splitVote } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should show restaurant" do
    sign_in @user
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    sign_in @user
    patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name, noSplitVote: @restaurant.noSplitVote, splitVote: @restaurant.splitVote } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should not update restaurant" do
   patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name, noSplitVote: @restaurant.noSplitVote, splitVote: @restaurant.splitVote } }
   assert_response :redirect
   assert_redirected_to new_user_session_path
 end

  # test "should destroy restaurant" do
  #   assert_difference('Restaurant.count', -1) do
  #     delete restaurant_url(@restaurant)
  #   end
  #
  #   assert_redirected_to restaurants_url
  # end
end
