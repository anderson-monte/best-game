class ProdutosPdf< Prawn::Document
  def initialize(produto)
    super(top_margin: 70)
    @prod = produto
    produto_nome
    listar
  end
  
  def produto_nome
    text "Produto \##{@prod.nome}", size: 30, style: :bold
  end
  
  def listar
          text "\##{@prod.nome}"
          text "\##{@prod.descricao}"
          text "\##{@prod.categoria.nome}"
          
  end
  
end