require 'test_helper'

class JournalTypesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:master_1zgm)
    @journal_type = journal_types(:finance)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journal_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal_type" do
    assert_difference('JournalType.count') do
      post :create, params: {journal_type: @journal_type.attributes}
    end

    assert_redirected_to journal_type_path(assigns(:journal_type))
  end

  test "should show journal_type" do
    get :show, params: {id: @journal_type.to_param}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @journal_type.to_param}
    assert_response :success
  end

  test "should update journal_type" do
    put :update, params: {id: @journal_type.to_param, journal_type: @journal_type.attributes}
    assert_redirected_to journal_type_path(assigns(:journal_type))
  end

  test "should destroy journal_type" do
    assert_difference('JournalType.count', -1) do
      delete :destroy, params: {id: @journal_type.to_param}
    end

    assert_redirected_to journal_types_path
  end
end
