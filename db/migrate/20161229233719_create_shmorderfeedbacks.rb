class CreateShmorderfeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :shmorderfeedbacks do |t|
      t.integer :requestID
      t.float :feedbackScore
      t.string :feedbackComment
      t.datetime :feedbackTime

      t.timestamps
    end
  end
end
