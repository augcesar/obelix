require 'test_helper'

class PlanosDiscagensControllerTest < ActionController::TestCase
  setup do
    @plano_discagem = planos_discagens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planos_discagens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plano_discagem" do
    assert_difference('PlanoDiscagem.count') do
      post :create, plano_discagem: { descricao: @plano_discagem.descricao }
    end

    assert_redirected_to plano_discagem_path(assigns(:plano_discagem))
  end

  test "should show plano_discagem" do
    get :show, id: @plano_discagem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plano_discagem
    assert_response :success
  end

  test "should update plano_discagem" do
    put :update, id: @plano_discagem, plano_discagem: { descricao: @plano_discagem.descricao }
    assert_redirected_to plano_discagem_path(assigns(:plano_discagem))
  end

  test "should destroy plano_discagem" do
    assert_difference('PlanoDiscagem.count', -1) do
      delete :destroy, id: @plano_discagem
    end

    assert_redirected_to planos_discagens_path
  end
end
