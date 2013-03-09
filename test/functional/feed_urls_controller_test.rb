require 'test_helper'

class FeedUrlsControllerTest < ActionController::TestCase
  setup do
    @feed_url = feed_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feed_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feed_url" do
    assert_difference('FeedUrl.count') do
      post :create, feed_url: { description: @feed_url.description, title: @feed_url.title, url: @feed_url.url }
    end

    assert_redirected_to feed_url_path(assigns(:feed_url))
  end

  test "should show feed_url" do
    get :show, id: @feed_url
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feed_url
    assert_response :success
  end

  test "should update feed_url" do
    put :update, id: @feed_url, feed_url: { description: @feed_url.description, title: @feed_url.title, url: @feed_url.url }
    assert_redirected_to feed_url_path(assigns(:feed_url))
  end

  test "should destroy feed_url" do
    assert_difference('FeedUrl.count', -1) do
      delete :destroy, id: @feed_url
    end

    assert_redirected_to feed_urls_path
  end
end
