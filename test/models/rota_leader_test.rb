# frozen_string_literal: true

require 'test_helper'

class RotaLeaderTest < ActiveSupport::TestCase
  test 'filters assignments with leaders and orders them by leader name' do
    meet = create_meet
    job = create_job
    zulu = create_leader(name: 'Zulu Leader')
    alpha = create_leader(name: 'Alpha Leader')
    assigned_zulu = meet.rota_leaders.create!(job: job, leader: zulu)
    assigned_alpha = meet.rota_leaders.create!(job: job, leader: alpha)
    RotaLeader.new(meet: meet, job: job).save!(validate: false)

    assert_equal [assigned_alpha, assigned_zulu], RotaLeader.has_leader.by_leader.to_a
    assert_equal [assigned_zulu], RotaLeader.filter_leader(zulu.id).to_a
  end

  test 'destroy expires a rota assignment' do
    assignment = create_meet.rota_leaders.create!(job: create_job, leader: create_leader)

    assignment.destroy

    assert_nil RotaLeader.find_by(id: assignment.id)
    assert RotaLeader.unscoped.find(assignment.id).expired
  end
end
