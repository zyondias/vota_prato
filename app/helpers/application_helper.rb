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

	def novo_comentario comentavel
		render partial: "comentarios/novo_comentario",
			   locals: {comentavel: comentavel}
	end

	def comentarios comentavel
		render partial: "comentarios/comentarios", locals: {comentarios: comentavel.comentarios}
	end
end
