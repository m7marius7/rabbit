class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :url

      t.timestamps
    end
  end
end


# class CreatePosts < ActiveRecord::Migration[7.0]
#   def change
#     create_table :posts do |t|
#       t.string :meta_title
#       t.text :meta_description
#       t.string :permalink
#       t.string :title
#       t.text :body
#       t.boolean :no_index

#       t.timestamps
#     end
#   end
# end
