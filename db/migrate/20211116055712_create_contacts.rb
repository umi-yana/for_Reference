class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :contact_name, null: false
      t.string :contact_email, null: false
      t.integer :contact_subject, default: 0, null: false
      t.text :contact_message, null: false

      t.timestamps
    end
  end
end
