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
      @lista = List.new
    end
        
    it "Insercion de un elemento" do
      @lista.add_nodo(1)
        
      expect(@lista.cabeza.value).to eq(1)
    end
    
    it "Insercion de varios elementos" do
      @lista.add_varios([2,3,4,5])
            
      expect(@lista.cabeza.prev.value).to eq(4)
    end
    
    it "Extraccion del primer elemento de la lista" do
      elemento_extraido = @lista.get_nodo()
            
      expect(elemento_extraido).to eq(1)
    end
  end
end
