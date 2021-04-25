class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :repo_url
      t.references :owner, polymorphic: true, null: false

      t.timestamps
    end
  end
end
