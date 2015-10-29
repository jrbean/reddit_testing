class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.boolean :status
      t.references :voteable, polymorphic: true, index: true


      t.timestamps null: false
    end
  end
end
