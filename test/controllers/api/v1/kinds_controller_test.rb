require 'test_helper'

class Api::V1::KindsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_kind = api_v1_kinds(:one)
  end

  test "should get index" do
    get api_v1_kinds_url, as: :json
    assert_response :success
  end

  test "should create api_v1_kind" do
    assert_difference('Api::V1::Kind.count') do
      post api_v1_kinds_url, params: { api_v1_kind: { name: @api_v1_kind.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_kind" do
    get api_v1_kind_url(@api_v1_kind), as: :json
    assert_response :success
  end

  test "should update api_v1_kind" do
    patch api_v1_kind_url(@api_v1_kind), params: { api_v1_kind: { name: @api_v1_kind.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_kind" do
    assert_difference('Api::V1::Kind.count', -1) do
      delete api_v1_kind_url(@api_v1_kind), as: :json
    end

    assert_response 204
  end
end
