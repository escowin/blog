class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      # auto-created : id column, the auto incrementing primary key.
      # CLI-created: bin/rails generate model Article title:string body:text
      t.string :title
      t.text :body

      # method defines created_at & updated_at columns. rails manages this
      t.timestamps
    end
  end
end
