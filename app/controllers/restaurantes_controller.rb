class RestaurantesController < ApplicationController

	#metodo que sera chamado na index
	def index
		#retornando a lista de nome
		@restaurantes = Restaurante.order :nome
	end
	#metodo para mostra detalhado o item
	def show
		@restaurante = Restaurante.find(params[:id])
	end

	#metodo para apagar 
	def destroy
		@restaurante = Restaurante.find(params[:id])
		@restaurante.delete
		redirect_to action: 'index'
	end

end
