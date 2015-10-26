module FilesHelper
	def processed?(value)
		value == true ? "Processado" : image_tag("progress.gif", size: "150x30")
	end
end
