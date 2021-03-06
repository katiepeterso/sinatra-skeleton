class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :username
      t.string :state
      t.string :password
      t.timestamps
    end

    create_table :pins do |t|
      t.string :title
      t.string :url
      t.timestamps
    end

    create_table :comments do |t|
      t.string :comment
      t.integer :user_id
      t.timestamps
    end

  end

end