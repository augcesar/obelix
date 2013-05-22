require 'test_helper'

class SipControllerTest < ActionController::TestCase
  setup do
    @sip = sip(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sip)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sip" do
    assert_difference('Sip.count') do
      post :create, sip: { bindaddr: @sip.bindaddr, bindport: @sip.bindport, context: @sip.context, limitonpeers: @sip.limitonpeers, t38pt_udptl: @sip.t38pt_udptl, tos_audio: @sip.tos_audio, tos_sip: @sip.tos_sip, tos_video: @sip.tos_video, videosupport: @sip.videosupport }
    end

    assert_redirected_to sip_path(assigns(:sip))
  end

  test "should show sip" do
    get :show, id: @sip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sip
    assert_response :success
  end

  test "should update sip" do
    put :update, id: @sip, sip: { bindaddr: @sip.bindaddr, bindport: @sip.bindport, context: @sip.context, limitonpeers: @sip.limitonpeers, t38pt_udptl: @sip.t38pt_udptl, tos_audio: @sip.tos_audio, tos_sip: @sip.tos_sip, tos_video: @sip.tos_video, videosupport: @sip.videosupport }
    assert_redirected_to sip_path(assigns(:sip))
  end

  test "should destroy sip" do
    assert_difference('Sip.count', -1) do
      delete :destroy, id: @sip
    end

    assert_redirected_to sip_index_path
  end
end
