require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    @restaurant = restaurants(:one)
    @vote = votes(:one)
  end

  test "should get index" do
    sign_in @user
    get votes_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_vote_url
    assert_response :success
  end

  test "should create vote" do
    sign_in @user
    assert_difference('Vote.count') do
      post votes_url, params: { vote: { restaurant_id: @vote.restaurant_id, user_id: @vote.user_id, isSplitVote: @vote.isSplitVote } }
    end

    assert_redirected_to vote_url(Vote.last)
  end

  test "should show vote" do
    sign_in @user
    get vote_url(@vote)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_vote_url(@vote)
    assert_response :success
  end

  test "should update vote" do
    sign_in @user
    patch vote_url(@vote), params: { vote: { restaurant_id: @vote.restaurant_id, user_id: @vote.user_id, isSplitVote: @vote.isSplitVote } }
    assert_redirected_to vote_url(@vote)
  end

  test "should destroy vote" do
    sign_in @user
    assert_difference('Vote.count', -1) do
      delete vote_url(@vote)
    end

    assert_redirected_to votes_url
  end
end
