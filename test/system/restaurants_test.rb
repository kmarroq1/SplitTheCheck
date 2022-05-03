require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)

    visit restaurants_url

    click_on "Vote Yes", match: :first
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: "test1234"
    click_on "Log in"
  end

  test "should favorite restaurant" do
    click_on "Show"
    click_on "Remove From Favorites"
    click_on "Show"
    click_on "Add To Favorites"
    assert_text "Restaurant was successfully favorited"
  end

  test "should unfavorite restaurant" do
    click_on "Show"
    click_on "Remove From Favorites"
    assert_text "Restaurant was successfully unfavorited"
  end

  test "should vote to split" do
    click_on "Vote Yes", match: :first
    assert_text "2 | 0"
  end

  test "should vote to not split" do
    click_on "Vote No", match: :first
    assert_text "1 | 1"
  end

  test "visiting the index" do
    assert_selector "th", text: "Restaurant Name"
  end

  test "creating a Restaurant" do
    click_on "New Restaurant"

    fill_in "Location", with: @restaurant.location
    fill_in "Name", with: @restaurant.name
    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant" do
    click_on "Edit", match: :first

    fill_in "Location", with: @restaurant.location
    fill_in "Name", with: @restaurant.name
    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    click_on "Back"
  end

  # test "destroying a Restaurant" do
  #   visit restaurants_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

  #   assert_text "Restaurant was successfully destroyed"
  # end
end
