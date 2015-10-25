module FilesHelper
	def processed?(value)
		value == true ? "Processado" : "Processando"
	end
end
