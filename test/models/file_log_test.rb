require 'test_helper'

class FileLogTest < ActiveSupport::TestCase
  test "Teste para verificar se salva em branco" do
  	file = FileLog.new
  	assert_not file.save
  end
end
