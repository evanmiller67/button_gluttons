require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = Factory(:player, :first_name => 'aaa', :last_name => 'bbb')
  end

  # test "should not get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:players)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create player" do
  #   assert_difference('Player.count') do
  #     post :create, player: @player.attributes
  #   end

  #   assert_redirected_to player_path(assigns(:player))
  # end

  test "should show fight" do
    @request.cookies['player_id'] = 'abc'
    get :show, id: @player
    # assert_response :redirect
    assert_redirected_to :controller => :fight
  end

  test "should show player" do
    @request.cookies['player_id'] = @player.id
    get :show, id: @player
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @player
  #   assert_response :success
  # end

  # test "should update player" do
  #   put :update, id: @player, player: @player.attributes
  #   assert_redirected_to player_path(assigns(:player))
  # end

  # test "should destroy player" do
  #   assert_difference('Player.count', -1) do
  #     delete :destroy, id: @player
  #   end

  #   assert_redirected_to players_path
  # end
end
