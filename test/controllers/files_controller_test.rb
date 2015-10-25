require 'test_helper'

class FilesControllerTest < ActionController::TestCase
  test "Teste para acessar a pagina de importar documentos" do
    get :index
    assert_response :success
  end

  test "Teste de upload de arquivo com arquivo" do
  	file = fixture_file_upload('files/dados.txt','text/plain')
  	post :create, :file_log => {:file => file}
  end

  test "Teste para acessar a pagina de listagem de importações de cocumento" do
    get :index
    assert_response :success
  end

end
