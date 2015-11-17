require 'spec_helper'

describe ListaEnlazada do
  context "Pruebas de Nodos" do
    before :all do
      @objeto_nodo = Node.new(1,nil,nil)
    end
        
    it "Debe existir un Nodo de la lista con sus datos" do
      expect(@objeto_nodo.value).to eq(1)
    end
    
    it "Debe existir un Nodo de la lista con su anterior" do
      expect(@objeto_nodo.prev).to eq(nil)
    end
        
    it "Debe existir un Nodo de la lista con su siguiente" do
      expect(@objeto_nodo.next).to eq(nil)
    end
  end
  
  context "Pruebas de Lista" do
    before :all do
      @nodo_1 = Node.new(1,nil,nil)
      @nodo_2 = Node.new(2,nil,nil)
      @nodo_3 = Node.new(3,nil,nil)
      @nodo_4 = Node.new(4,nil,nil)
      @nodo_5 = Node.new(5,nil,nil)
            
      @lista = List.new(nil)
    end
        
    it "Insercion de un elemento" do
      @lista.add_nodo(@nodo_1)
        
      expect(@lista.cabeza).to eq(@nodo_1)
    end
  end
end
