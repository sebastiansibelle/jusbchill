require 'test_helper'

class MixesControllerTest < ActionController::TestCase
  setup do
    @mix = mixes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mixes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mix" do
    assert_difference('Mix.count') do
      post :create, mix: { artist_id: @mix.artist_id, avatar: @mix.avatar, description: @mix.description, mix_no: @mix.mix_no, soundcloud: @mix.soundcloud, title: @mix.title }
    end

    assert_redirected_to mix_path(assigns(:mix))
  end

  test "should show mix" do
    get :show, id: @mix
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mix
    assert_response :success
  end

  test "should update mix" do
    patch :update, id: @mix, mix: { artist_id: @mix.artist_id, avatar: @mix.avatar, description: @mix.description, mix_no: @mix.mix_no, soundcloud: @mix.soundcloud, title: @mix.title }
    assert_redirected_to mix_path(assigns(:mix))
  end

  test "should destroy mix" do
    assert_difference('Mix.count', -1) do
      delete :destroy, id: @mix
    end

    assert_redirected_to mixes_path
  end
end
