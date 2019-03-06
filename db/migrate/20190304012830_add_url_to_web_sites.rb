class AddUrlToWebSites < ActiveRecord::Migration[5.0]
  def change
    add_index :web_sites, :url
  end
end
