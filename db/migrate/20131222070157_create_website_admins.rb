class CreateWebsiteAdmins < ActiveRecord::Migration
  def change
    create_table :website_admins do |t|

      t.timestamps
    end
  end
end
