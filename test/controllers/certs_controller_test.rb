require 'test_helper'

class CertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cert = certs(:one)
  end

  test "should get index" do
    get certs_url
    assert_response :success
  end

  test "should get new" do
    get new_cert_url
    assert_response :success
  end

  test "should create cert" do
    assert_difference('Cert.count') do
      post certs_url, params: { cert: { active: @cert.active, certifiable_id: @cert.certifiable_id, expires_on: @cert.expires_on, permanent: @cert.permanent, require_id: @cert.require_id, require_type: @cert.require_type, serial_number: @cert.serial_number } }
    end

    assert_redirected_to cert_url(Cert.last)
  end

  test "should show cert" do
    get cert_url(@cert)
    assert_response :success
  end

  test "should get edit" do
    get edit_cert_url(@cert)
    assert_response :success
  end

  test "should update cert" do
    patch cert_url(@cert), params: { cert: { active: @cert.active, certifiable_id: @cert.certifiable_id, expires_on: @cert.expires_on, permanent: @cert.permanent, require_id: @cert.require_id, require_type: @cert.require_type, serial_number: @cert.serial_number } }
    assert_redirected_to cert_url(@cert)
  end

  test "should destroy cert" do
    assert_difference('Cert.count', -1) do
      delete cert_url(@cert)
    end

    assert_redirected_to certs_url
  end
end
