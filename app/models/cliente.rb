class Cliente < ActiveRecord::Base
  # attr_accessible :title, :body
    #deixa disponivel para poder grava no banco aparti de um formulario ou iput url ou hash
  	attr_accessible :nome, :idade
  	#informando que o cliente tem varias qualificações
  	has_many :qualificacoes

  	#validações
  	validates_presence_of :nome, message: " - deve ser preenchido"
  	validate_uniqueness_of :nome, message: "- nome já cadastrado"
  	validate_numericality_of :idade, greater_than: 0, less_than: 100, message: " - deve ser numero entre 0 e 100"

end
