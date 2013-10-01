require 'test_helper'

class IaxControllerTest < ActionController::TestCase
  setup do
    @iax = iax(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iax)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iax" do
    assert_difference('Iax.count') do
      post :create, iax: { allow: @iax.allow, bandwidth: @iax.bandwidth, bindaddr: @iax.bindaddr, bindport: @iax.bindport, disallow: @iax.disallow, tos: @iax.tos }
    end

    assert_redirected_to iax_path(assigns(:iax))
  end

  test "should show iax" do
    get :show, id: @iax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iax
    assert_response :success
  end

  test "should update iax" do
    put :update, id: @iax, iax: { allow: @iax.allow, bandwidth: @iax.bandwidth, bindaddr: @iax.bindaddr, bindport: @iax.bindport, disallow: @iax.disallow, tos: @iax.tos }
    assert_redirected_to iax_path(assigns(:iax))
  end

  test "should destroy iax" do
    assert_difference('Iax.count', -1) do
      delete :destroy, id: @iax
    end

    assert_redirected_to iax_index_path
  end
end
