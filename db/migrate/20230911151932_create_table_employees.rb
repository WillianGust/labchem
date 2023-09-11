class CreateTableEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :table_employees do |t|
      t.string :nom
      t.string :titre_poste
      t.text :responsabilite
      t.text :exigence
      t.text :experience
      t.text :profil_competence
      t.text :besoin_marche

      t.timestamps
    end
  end
end
