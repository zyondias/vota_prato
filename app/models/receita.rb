class Receita < ActiveRecord::Base
  # attr_accessible :title, :body
  #deixa disponivel para poder grava no banco aparti de um formulario ou iput url ou hash
  attr_accessible :prato_id, :conteudo

  #informando que receita pertencte a um prato
   belongs_to :prato

  #validacao
  validates_presnce_of :conteudo, :message: " -  deve ser prenchido"

  #validando o relacionamento 
  validates_presnce_of :prato_id
  validates_associated :prato
end
