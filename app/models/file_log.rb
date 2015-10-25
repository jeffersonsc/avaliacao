class FileLog < ActiveRecord::Base
	attr_accessor :file

  validate :validate_file
  
  validates_presence_of :file, message: "Por favor selecione um arquivo."
 	
  private

  def validate_file
  	errors.add(:file , "Formato de arquivo inválido. O Aquivo precisa ser .txt") if self.file.present? and self.file.content_type != "text/plain"
  end
end
