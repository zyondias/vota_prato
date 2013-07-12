class AddColumEspecialidadeToRestaurantes < ActiveRecord::Migration
  def change
    add_column :restaurantes, :especialidade, :string
  end
end
