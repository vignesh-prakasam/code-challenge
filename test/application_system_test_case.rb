require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  test "search for a breed and display image" do
    visit root_path

    fill_in "breed", with: "akita"
    click_on "Submit"

    sleep 5

    assert_selector "img"
  end

  test "search for a non-existent breed and display error message" do
    visit root_path

    fill_in "breed", with: "nobreed"
    click_on "Submit"

    sleep 5

    assert_no_selector "img"
    assert_text "No dog images found for nobreed"
  end

end
