# frozen_string_literal: true

require 'test_helper'

# == Schema Information
#
# Table name: rota_leaders
#
#  id         :bigint           not null, primary key
#  expired    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :bigint           indexed
#  leader_id  :bigint           indexed
#  meet_id    :bigint           indexed
#
# Indexes
#
#  index_rota_leaders_on_job_id     (job_id)
#  index_rota_leaders_on_leader_id  (leader_id)
#  index_rota_leaders_on_meet_id    (meet_id)
#
# Foreign Keys
#
#  fk_rota_leader_job     (job_id => jobs.id)
#  fk_rota_leader_leader  (leader_id => leaders.id)
#  fk_rota_leader_meet    (meet_id => meets.id)
#
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
