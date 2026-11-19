# frozen_string_literal: true

require 'test_helper'

class MeetsControllerTest < ActionController::TestCase
  test 'creates a meet with a rota assignment' do
    meet_type = create_meet_type
    job = create_job
    leader = create_leader

    post :create, params: {
      meet: {
        meet_date: Date.current + 10,
        meet_type_id: meet_type.id,
        rota_leaders_attributes: { '0' => { job_id: job.id, leader_id: leader.id } }
      }
    }

    meet = Meet.find_by!(meet_date: Date.current + 10)
    assert_redirected_to meet
    assert_equal [leader], meet.rota_leaders.map(&:leader)
  end

  test 'updates a meet date and lists upcoming and historic meetings' do
    meet = create_meet(meet_date: Date.current + 2)

    patch :update, params: { id: meet.id, meet: { meet_date: Date.current + 3 } }
    assert_redirected_to meet
    assert_equal Date.current + 3, meet.reload.meet_date

    historic = create_meet(meet_date: Date.current - 1)
    get :index
    assert_response :success
    assert_includes response.body, meet.meet_date.to_formatted_s(:long_ordinal)
    assert_not_includes response.body, historic.meet_date.to_formatted_s(:long_ordinal)

    get :index, params: { historic: 'true' }
    assert_includes response.body, historic.meet_date.to_formatted_s(:long_ordinal)
  end

  test 'shows registered details and filters children with medical conditions' do
    meet = create_meet
    child_with_condition = create_child(name: 'Child With Asthma', medical_conditions: 'Asthma')
    child_without_condition = create_child(name: 'Child Without Condition', medical_conditions: 'none')
    carer = create_carer
    leader = create_leader
    job = create_job
    meet.child_to_meets.create!(child: child_with_condition)
    meet.child_to_meets.create!(child: child_without_condition)
    meet.carer_to_meets.create!(carer: carer)
    meet.leader_to_meets.create!(leader: leader)
    meet.rota_leaders.create!(leader: leader, job: job)

    get :show, params: { id: meet.id }
    assert_response :success
    assert_includes response.body, leader.name

    get :register, params: { id: meet.id }
    assert_response :success
    assert_includes response.body, child_with_condition.name
    assert_includes response.body, carer.name

    get :medical_conditions, params: { id: meet.id }
    assert_response :success
    assert_includes response.body, child_with_condition.name
    assert_not_includes response.body, child_without_condition.name
  end
end
