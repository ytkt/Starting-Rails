class AddBlogIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :blog_id, :integer
  end
end
