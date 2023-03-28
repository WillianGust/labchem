class ProjectName < ActiveRecord::Migration[7.0]
  def change
    remove_column :formulations, :product_name, :string
    add_column :formulations, :project_name, :string
  end
end
