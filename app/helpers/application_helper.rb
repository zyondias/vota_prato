module ApplicationHelper

	def valor_formatado(number)
		number_to_currency number,
			unit: "R$: ",
			separador: ",",	
			delimiter: "."
	end
	    
	def data_formatada(data)
		data.strftime('%d/%m/%Y')
	end
end
