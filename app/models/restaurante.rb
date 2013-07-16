#encoding: utf-8

class Restaurante < ActiveRecord::Base
  # attr_accessible :title, :body

  #informando que tem varias qualificações (relacionamento de tabela)
  has_many :qualificacoes
  #informando que um restaurante tem varios pratos e um prato varios restaurantes
  has_and_belongs_to_many :pratos


  #deixa disponivel para poder grava no banco aparti de um formulario ou iput url ou hash
  attr_accessible :nome, :endereco, :especialidade

  #validador proto do rails para vailidar contem nome e endereco
  validates_presence_of :nome, :message => 'Digitar um nome por favor'
  validates_presence_of :endereco, :message => 'Digitar um endereco por favor'

  #validando o tamanho
  validates_length_of :nome, :maximum => 80, :message => 'Digite menor que 80'

  #validando que o nome seja unico
  validates_uniqueness_of :nome, :message => 'nome deve ser unico'

  #outra forma de validar
  validates :especialidade, presence:{message: "A especialidade deve ser preenchida"}, uniqueness: true

   #chamando validacaoes criadas
   validate :primeira_letra_deve_ser_maiusucula, :nao_pode_ser_coxinha

   #criando minha propria validacao
   #criando validacao para primeira letra maiuscula
   private

   def primeira_letra_deve_ser_maiusucula
   	errors.add(:nome, "primeira letra deve ser maiuscula") unless nome =~ /[A-Z].*/
   end

   #validando se é coxinha a especialidade
   def nao_pode_ser_coxinha 
   		if :especialidade == "coxinha"
   			errors.add(:especialidade,"Nao pode ser coxinha")
   		end
   end
end
