require 'test_helper'

class SnotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @snote = snotes(:one)
  end

  test "should get index" do
    get snotes_url
    assert_response :success
  end

  test "should get new" do
    get new_snote_url
    assert_response :success
  end

  test "should create snote" do
    assert_difference('Snote.count') do
      post snotes_url, params: { snote: { answer: @snote.answer, freq: @snote.freq, note_id: @snote.note_id, pnote: @snote.pnote, title: @snote.title, user_id: @snote.user_id } }
    end

    assert_redirected_to snote_url(Snote.last)
  end

  test "should show snote" do
    get snote_url(@snote)
    assert_response :success
  end

  test "should get edit" do
    get edit_snote_url(@snote)
    assert_response :success
  end

  test "should update snote" do
    patch snote_url(@snote), params: { snote: { answer: @snote.answer, freq: @snote.freq, note_id: @snote.note_id, pnote: @snote.pnote, title: @snote.title, user_id: @snote.user_id } }
    assert_redirected_to snote_url(@snote)
  end

  test "should destroy snote" do
    assert_difference('Snote.count', -1) do
      delete snote_url(@snote)
    end

    assert_redirected_to snotes_url
  end
end
