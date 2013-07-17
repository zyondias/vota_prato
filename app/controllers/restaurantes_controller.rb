class RestaurantesController < ApplicationController

	#executando o metodo set_restaurete antes de executar os metodos dentro do only
	before_filter :set_restaurante, only:[:edit,:destroy,:update,:show]

	#metodo que sera chamado na index
	def index
		#retornando a lista de nome
		@restaurantes = Restaurante.order :nome

		#verificando qual formato foi solicitado para poder retorna ou html ou jsnon ou xml
		respond_to do |format|
			format.html
			format.xml {render xml: @restaurantes}
			format.json {render json: @restaurantes}
		end
	end
	#metodo para mostra detalhado o item
	def show
		#verificando qual formato foi solicitado para poder retorna ou html ou jsnon ou xml
		respond_to do |format|
			format.html
			format.xml {render xml: @restaurante}
			format.json {render json: @restaurante}
		end
	end

	#metodo para apagar 
	def destroy
		@restaurante.delete
		redirect_to action: 'index'
	end

	#metodo pessistir na base da dados o restaurante
	def create
		if @restaurante.save
			redirect_to(action:'show', id:@restaurante)		
		else
			render action:'new'
			end
	end

	#criando um novo objeto de restaurante para que seja usado na view "NEW"
	def new
		@restaurante = Restaurante.new
	end

	#metodo para retorna informações do restaurante selecionado para a view edit
	def edit

	end
	#metodo que vai pessistir no banco a alteração feita no update
	def update
		if @restaurante.update_attributes(params[:restaurante])
			redirect_to action:'show', id:@restaurante
		else
			render action:'edit'
		end
	end

	private
	#metodo para setar restaurate
	def set_restaurante
		@restaurante = Restaurante.find(params[:id])	
	end
end