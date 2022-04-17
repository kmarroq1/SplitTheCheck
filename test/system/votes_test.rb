require "application_system_test_case"

class VotesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @restaurant = restaurants(:one)
    @vote = votes(:one)

    visit votes_url
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: "test1234"
    click_on "Log in"
  end

  test "visiting the index" do
    assert_selector "h1", text: "Votes"
  end

  test "creating a Vote" do
    click_on "New Vote"

    fill_in "Restaurant", with: @vote.restaurant_id
    fill_in "User", with: @vote.user_id
    click_on "Create Vote"

    assert_text "Vote was successfully created"
    click_on "Back"
  end

  test "updating a Vote" do
    click_on "Edit", match: :first

    fill_in "Restaurant", with: @vote.restaurant_id
    fill_in "User", with: @vote.user_id
    click_on "Update Vote"

    assert_text "Vote was successfully updated"
    click_on "Back"
  end

  test "destroying a Vote" do
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vote was successfully destroyed"
  end
end
