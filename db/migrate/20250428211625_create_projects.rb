class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :technologies
      t.string :github_link
      t.string :deploy_link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
