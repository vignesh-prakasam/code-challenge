require "test_helper"
require 'mocha/minitest'

class DogsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @breed = "akita"
    @image = "akita.jpg"
    DogService.any_instance.stubs(:get_dog_image).returns(@image)
    ActionView::Base.any_instance.stubs(:image_tag).returns("<img src=#{@image}>")
  end

  test "should get home page" do
    get root_url
    assert_response :success
  end

  test "should get view and set breed name to display" do
    post dogs_view_url, params: { breed: @breed }, as: :turbo_stream

    assert_response :success
    assert_equal @breed, assigns(:breed)
  end

  test "should set dog_image" do
    post dogs_view_url, params: { breed: @breed }, as: :turbo_stream
    assert_equal @image, assigns(:dog_image)
  end

  test "should get view and check turbo-stream response" do
    post dogs_view_url, params: { breed: 'akita' }, as: :turbo_stream
    assert_response :success

    assert_includes @response.body, '<turbo-stream action="replace" target="dog_image">'
    assert_includes @response.body, '<turbo-frame id="dog_image">'
    assert_includes @response.body, "<h4 class=\"breed-name\">#{@breed}</h4>"
  end
end
