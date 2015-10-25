namespace :fileprocess do
  desc "Busca os arquivos ainda não processados para processar"
  task execute: :environment do
  	FileLog.where(processed: false).each do |data_file|
			#Carrega o arquivo e faz a leitura das linhas salvando em uma array cada linha
			file = File.open(Rails.root.join("tmp", data_file.name), "r").readlines.map(&:chomp)
			
			#Remove a primeira linha pois não é interssante salvar
			file.shift
			
			#Faz a leitura do array para fazermos o parser de cada linha
			#data[0] Nome do cliente
			#data[1] Nome do produto
			#data[2] Preço unitário
			#data[3] Quantidade
			#data[4] Endereço
			#data[5] Fornecedor
			file.each do |line|
				data = line.split(/\t/) #Realizamos o split por tabulação
				
				#Verifica se o cliente existe
				customer = Customer.find_by(name: data[0])
				if !customer
					customer = Customer.create(name: data[0])
				end

				#Verifica se já existe o produto
				product = Product.find_by(name: data[1])
				if !product
					product = Product.create(name: data[1], price: data[2])
				end

				#Verifica se o endereço já existe
				address = Address.find_by(street: data[4])
				if !address
					address = Address.create(street: data[4])
				end

				#Verifica se o fornecedor já existe
				provider = Provider.find_by(name: data[5])
				if !provider
					provider = Provider.create(name: data[5])
				end

				#Depois de pegar as informações vamos criar a ordem
				#Verificamos se a ordem já existe caso não criamos

				order = Order.find_by(customer_id: customer.id, product_id: product.id, address_id: address.id, provider_id: provider.id , amount: data[3])
				if !order
					Order.create(customer_id: customer.id, product_id: product.id, address_id: address.id, provider_id: provider.id , amount: data[3], unit_price: product.price)
				end

			end

			#Depois de processar excluimos o arquivo
			File.delete(Rails.root.join("tmp", data_file.name))
			data_file.update_attribute(:processed, true)
  	end
  end

end
