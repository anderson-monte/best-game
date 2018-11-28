json.extract! produto, :id, :nome, :preco, :quantidade, :descricao, :categoria_id, :created_at, :updated_at
json.url produto_url(produto, format: :json)
