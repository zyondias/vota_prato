class Qualificacao < ActiveRecord::Base
  # attr_accessible :title, :body
  #deixa disponivel para poder grava no banco aparti de um formulario ou iput url ou hash
  attr_accessible :nota, :valor_gasto, :cliente_id, :restaurante_id

   #informando que pertece a um cliente
   belongs_to :cliente
   #informando que essa class pertece a um restaurante
   belongs_to :restaurante

  #validacoes 
  validates_presence_of :nome, message:" - deve ser preenchido "
  validates_presence_of :valor_gasto, message:" - deve ser preenchido"

  #validadndo o relacionamento
  validates_presence_of :cliente_id, :restaurante_id
  validate_associated :cliente, :restaurante

  validates_numericality_of :nota, greater_than_or_equal_to: 0, less_than_or_equal_to: 10, message: "- deve ser um numero"
  validates_numericality_of :valor_gasto, greater_than: 0, message: " deve ser numero maior que 0"
end
