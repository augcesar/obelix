require 'test_helper'

class MonitoramentosControllerTest < ActionController::TestCase
  setup do
    @monitoramento = monitoramentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monitoramentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monitoramento" do
    assert_difference('Monitoramento.count') do
      post :create, monitoramento: {  }
    end

    assert_redirected_to monitoramento_path(assigns(:monitoramento))
  end

  test "should show monitoramento" do
    get :show, id: @monitoramento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monitoramento
    assert_response :success
  end

  test "should update monitoramento" do
    put :update, id: @monitoramento, monitoramento: {  }
    assert_redirected_to monitoramento_path(assigns(:monitoramento))
  end

  test "should destroy monitoramento" do
    assert_difference('Monitoramento.count', -1) do
      delete :destroy, id: @monitoramento
    end

    assert_redirected_to monitoramentos_path
  end
end
