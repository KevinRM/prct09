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
  
  context "Pruebas de clase Referencia" do
    before :each do
      @objeto_referencia = Referencia.new("Kevin","titulo_referencia","17-11-2015")
    end
    
    it "La clase referencia tiene un autor" do
      expect(@objeto_referencia.get_autor()).to eq("Kevin")
    end
    
    it "La clase referencia tiene un titulo" do
      expect(@objeto_referencia.get_titulo()).to eq("titulo_referencia")
    end
    
    it "La clase referencia tiene una fecha de publicacion" do
      expect(@objeto_referencia.get_publicacion()).to eq("17-11-2015")
    end
  end
  
  context "Pruebas para la clase de herencia Libro" do
    before :each do
      @objeto_libro = Libro.new("Kevin_libro","titulo_libro","17-11-2015_libro","ISBN_11111")
    end
    
    it "Responde a objeto de herencia de la clase Referencia" do
      expect(@objeto_libro).is_a? Referencia
    end
    
    it "Libro tiene un Autor" do
      expect(@objeto_libro.get_autor()).to eq("Kevin_libro")
    end
    
    it "Libro tiene un ISBN" do
      expect(@objeto_libro.get_isbn()).to eq("ISBN_11111")
    end
  end
  
  context "Pruebas para la clase de herencia Revista" do
    before :each do
      @objeto_revista = Revista.new("Kevin_revista","titulo_revista","17-11-2015_revista","ISSN_22222")
    end
    
    it "Responde a objeto de herencia de la clase Referencia" do
      expect(@objeto_revista).is_a? Referencia
    end
    
    it "Revista tiene un Autor" do
      expect(@objeto_revista.get_autor()).to eq("Kevin_revista")
    end
    
    it "Revista tiene un ISSN" do
      expect(@objeto_revista.get_issn()).to eq("ISSN_22222")
    end
  end
end
