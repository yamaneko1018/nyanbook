class AddImageurlToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :imageurl, :string
  end
end
