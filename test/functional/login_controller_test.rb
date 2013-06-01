require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  setup do
    @login = login(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:login)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create login" do
    assert_difference('Login.count') do
      post :create, login: { ativo: @login.ativo, senha: @login.senha, usuario: @login.usuario }
    end

    assert_redirected_to login_path(assigns(:login))
  end

  test "should show login" do
    get :show, id: @login
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @login
    assert_response :success
  end

  test "should update login" do
    put :update, id: @login, login: { ativo: @login.ativo, senha: @login.senha, usuario: @login.usuario }
    assert_redirected_to login_path(assigns(:login))
  end

  test "should destroy login" do
    assert_difference('Login.count', -1) do
      delete :destroy, id: @login
    end

    assert_redirected_to login_index_path
  end
end
