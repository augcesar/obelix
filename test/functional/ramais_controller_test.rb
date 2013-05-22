require 'test_helper'

class RamaisControllerTest < ActionController::TestCase
  setup do
    @ramal = ramais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ramais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ramal" do
    assert_difference('Ramal.count') do
      post :create, ramal: { call_limit: @ramal.call_limit, callerid: @ramal.callerid, canreinvite: @ramal.canreinvite, context: @ramal.context, dtmfmode: @ramal.dtmfmode, host: @ramal.host, nat: @ramal.nat, secret: @ramal.secret, type: @ramal.type, username: @ramal.username }
    end

    assert_redirected_to ramal_path(assigns(:ramal))
  end

  test "should show ramal" do
    get :show, id: @ramal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ramal
    assert_response :success
  end

  test "should update ramal" do
    put :update, id: @ramal, ramal: { call_limit: @ramal.call_limit, callerid: @ramal.callerid, canreinvite: @ramal.canreinvite, context: @ramal.context, dtmfmode: @ramal.dtmfmode, host: @ramal.host, nat: @ramal.nat, secret: @ramal.secret, type: @ramal.type, username: @ramal.username }
    assert_redirected_to ramal_path(assigns(:ramal))
  end

  test "should destroy ramal" do
    assert_difference('Ramal.count', -1) do
      delete :destroy, id: @ramal
    end

    assert_redirected_to ramais_path
  end
end
