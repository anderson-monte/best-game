class ProdutosController < ApplicationController
        before_action :set_produto, only: [:show, :edit, :update, :destroy]
        before_action :authenticate_usuario!, except: [:busca, :games, :hardware, :pdf]
       
       
       
       
  def pdf (produto)
     respond_to do |format|
     format.html
     format.pdf do
       pdf = ProdutosPdf.new(produto)
       send_data pdf.render, filename: "hello.pdf",
                            type: "application/pdf",
                            disposition: "inline"
      end
    end
  end
  
  def busca
    @nome_buscado = params[:nome]
    @produtos = Produto.paginate(:page => params[:page], :per_page => 15).where "nome like ?", "%#{@nome_buscado}%"
  end
  
  def games
    @produtos = Produto.paginate(:page => params[:page], :per_page => 8).where(categoria: 1)
  end 
  
  def hardware
      @produtos = Produto.paginate(:page => params[:page], :per_page => 8).where(categoria: 2)
  end 

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all.paginate(:page => params[:page], :per_page => 10)
  end
  
  # GET /produtos/1
  # GET /produtos/1.json
  def show
   pdf (@produto)
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto was successfully created.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome, :preco, :quantidade, :descricao, :categoria_id, :imagem)
    end
    
end
