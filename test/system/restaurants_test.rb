require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "voting" do
    visit restaurants_url
    click_on "Vote", match: :first
    assert_text "2 | 1"
  end

  test "visiting the index" do
    visit restaurants_url
    assert_selector "th", text: "Restaurant Name"
  end

  test "creating a Restaurant" do
    visit restaurants_url
    click_on "New Restaurant"

    fill_in "Location", with: @restaurant.location
    fill_in "Name", with: @restaurant.name
    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant" do
    visit restaurants_url
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
  #
  #   assert_text "Restaurant was successfully destroyed"
  # end
end
