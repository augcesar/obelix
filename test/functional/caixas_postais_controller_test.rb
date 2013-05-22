require 'test_helper'

class CaixasPostaisControllerTest < ActionController::TestCase
  setup do
    @caixa_postal = caixas_postais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caixas_postais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caixa_postal" do
    assert_difference('CaixaPostal.count') do
      post :create, caixa_postal: { descricao: @caixa_postal.descricao }
    end

    assert_redirected_to caixa_postal_path(assigns(:caixa_postal))
  end

  test "should show caixa_postal" do
    get :show, id: @caixa_postal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caixa_postal
    assert_response :success
  end

  test "should update caixa_postal" do
    put :update, id: @caixa_postal, caixa_postal: { descricao: @caixa_postal.descricao }
    assert_redirected_to caixa_postal_path(assigns(:caixa_postal))
  end

  test "should destroy caixa_postal" do
    assert_difference('CaixaPostal.count', -1) do
      delete :destroy, id: @caixa_postal
    end

    assert_redirected_to caixas_postais_path
  end
end
