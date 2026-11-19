# frozen_string_literal: true

require 'test_helper'

class HowHeardsControllerTest < ActionController::TestCase
  test 'creates a source and renders invalid input' do
    post :create, params: { how_heard: { location_name: 'School' } }
    assert_redirected_to how_heards_path
    assert HowHeard.exists?(location_name: 'School')

    post :create, params: { how_heard: { location_name: '' } }
    assert_response :success
  end

  test 'updates and soft deletes a source' do
    source = HowHeard.create!(location_name: 'Nursery')

    patch :update, params: { id: source.id, how_heard: { location_name: 'Library' } }
    assert_redirected_to how_heards_path
    assert_equal 'Library', source.reload.location_name

    delete :destroy, params: { id: source.id }
    assert_redirected_to how_heards_path
    assert_nil HowHeard.find_by(id: source.id)
  end
end
