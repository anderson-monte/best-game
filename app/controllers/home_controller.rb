class HomeController < ApplicationController
    
    def inicio
         @produtos = Produto.all
    end

end
