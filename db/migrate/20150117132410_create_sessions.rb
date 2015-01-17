class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions, id: :uuid do |t|
      t.uuid :user_id, index: true
      t.datetime :expires_at, null: false

      t.timestamps null: false
    end
  end
end
