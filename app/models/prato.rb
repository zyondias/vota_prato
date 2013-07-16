class Prato < ActiveRecord::Base
  # attr_accessible :title, :body
  #deixa disponivel para poder grava no banco aparti de um formulario ou iput url ou hash
  attr_accessible :nome

  #informando que um prato pode ter uma receita
  has_one :receita
  #informando que um prato tem varios restaurantes
  has_and_belongs_to_many :restaurantes

  #validações
  validates_presence_of :nome, message: " - deve ser preenchido"
  validates_uniqueness_of :nome, message: " - nome j´a cadastrado"

  #validando o relacionamento
  validate :validate_presence_of_more_than_one_restaurante

  private
   def validate_presence_of_more_than_one_restaurante
   		errors.add("restaurantes", "deve haver a menos um restaurante") if restaurantes.empty?
   end
end
