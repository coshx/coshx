class DisallowNullInRequiredColumns < ActiveRecord::Migration

  def up
    change_column :clients, :name,         :string, :null => false
    change_column :clients, :company_logo, :string, :null => false
    change_column :clients, :site_url,     :string, :null => false

    change_column :jobs, :title,       :string, :null => false
    change_column :jobs, :description, :text,   :null => false

    change_column :posts, :title,     :string,  :null => false
    change_column :posts, :body,      :text,    :null => false
    change_column :posts, :author_id, :integer, :null => false
  end

  def down
    change_column :clients, :name,         :string, :null => true
    change_column :clients, :company_logo, :string, :null => true
    change_column :clients, :site_url,     :string, :null => true

    change_column :jobs, :title,       :string, :null => true
    change_column :jobs, :description, :text,   :null => true

    change_column :posts, :title,     :string,  :null => true
    change_column :posts, :body,      :text,    :null => true
    change_column :posts, :author_id, :integer, :null => true
  end

end
