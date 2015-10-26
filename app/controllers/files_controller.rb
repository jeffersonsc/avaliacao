class FilesController < ApplicationController
	def index
		@files = FileLog.all 	
	end

	def new
		@file = FileLog.new
	end

	def create
		@file = FileLog.new(set_params) 

		if !set_params["file"].nil?
			original_file = params[:file_log][:file]
			@file.original_filename = original_file.original_filename
			time = Time.now
			@file.name = "#{rand(10000)}-#{original_file.original_filename}"
			@file.content_type = original_file.content_type
		end
		
		if @file.save			
			
			#Cria uma arquivo no tmp para ser processado em backgound
			File.open(Rails.root.join("tmp", @file.name ), "wb") do |file|
				file.write(original_file.read)
			end

			run_rake("fileprocess:execute")
			flash[:notice] = "Arquivo importado com sucesso. Em alguns minutos será importado para o banco de dados"
			redirect_to files_url
		else
			render :new
		end
	end

	private
	def set_params
		if params[:file_log].nil?
			return {"file" => nil}
		else
		 return params.require(:file_log).permit(:file)
		end
	end
end
