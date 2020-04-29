class CreateMeetTypeJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :meet_type_jobs do |t|
      t.references :job, index: true
      t.references :meet_type, index: true
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
