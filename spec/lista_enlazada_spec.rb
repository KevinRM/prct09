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
    
    it "Es un objeto de herencia de la clase Referencia" do
      expect(@objeto_libro).is_a? Referencia
    end
    
    it "No es un objeto de la clase Revista" do
      expect(@objeto_elect.respond_to? "Revista").to eq false
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
    
    it "Es un objeto de herencia de la clase Referencia" do
      expect(@objeto_revista).is_a? Referencia
    end
    
    it "No es un objeto de la clase Libro" do
      expect(@objeto_elect.respond_to? "Libro").to eq false
    end
    
    it "Revista tiene un Autor" do
      expect(@objeto_revista.get_autor()).to eq("Kevin_revista")
    end
    
    it "Revista tiene un ISSN" do
      expect(@objeto_revista.get_issn()).to eq("ISSN_22222")
    end
  end
  
  context "Pruebas para la clase de herencia Periódico" do
    before :each do
      @objeto_periodico = Periodico.new("Kevin_periodico","titulo_periodico","17-11-2015_periodico","La Laguna")
    end
    
    it "Es un objeto de herencia de la clase Referencia" do
      expect(@objeto_periodico).is_a? Referencia
    end
    
    it "No es un objeto de la clase Revista" do
      expect(@objeto_elect.respond_to? "Revista").to eq false
    end
    
    it "Periodico tiene un Autor" do
      expect(@objeto_periodico.get_autor()).to eq("Kevin_periodico")
    end
    
    it "Periodico tiene un Lugar" do
      expect(@objeto_periodico.get_lugar()).to eq("La Laguna")
    end
  end
  
  context "Pruebas para la clase de herencia documento Electronico" do
    before :each do
      @objeto_elect = Doc_elect.new("Kevin_documento_electronico","titulo_electronico","17-11-2015_documento_electronico","https://periodico.com")
    end
    
    it "Es un objeto de herencia de la clase Referencia" do
      expect(@objeto_elect).is_a? Referencia
    end
    
    it "No es un objeto de la clase Periodico" do
      expect(@objeto_elect.respond_to? "Periodico").to eq false
    end
    
    it "Documento electronico tiene un Autor" do
      expect(@objeto_elect.get_autor()).to eq("Kevin_documento_electronico")
    end
    
    it "Documento electronico tiene una URL" do
      expect(@objeto_elect.get_url()).to eq("https://periodico.com")
    end
  end
  
  context "Comparaciones entre dos referencias bibliograficas por titulo" do
    before :each do
      @libro_1 = Libro.new("Pepe Martinez","Ave","23-11-2015","ISBN_12856336563")
      @libro_2 = Libro.new("Marta Flores","Estampa","23-11-2015","ISBN_62856294")
      @revista_1 = Revista.new("Lola Estebez","Comidas","4-5-2008","ISSN_73445754")
      @doc_elect_1 = Doc_elect.new("Abian Fernandez","Willson","5-1-1800","https://periodico.com/willson")
    end
    
    it "El titulo de libro Ave es menor que el titulo de libro Estampa" do
      expect(@libro_1 < @libro_2).to eq(true)
    end
    
    it "El titulo de libro Estampa es menor que el titulo de libro Ave" do
      expect(@libro_1 > @libro_2).to eq(false)
    end
    
    it "El titulo de Revista Comidas es menor o igual que el titulo de libro Estampa" do
      expect(@revista_1 <= @libro_2).to eq(true)
    end
    
    it "El titulo de Documento electronico Willson es mayor o igual que el titulo de Revista Comidas" do
      expect(@doc_elect_1 >= @revista_1).to eq(true)
    end
    
    it "El titulo de libro Ave es igual al titulo de libro Ave" do
      expect(@libro_1 == @libro_1).to eq(true)
    end
  end
  
  context "Lista enumerable" do
    before :each do
      @lista_1 = List.new()
      @lista_1.add_varios([3,2,7,9,8])
      @lista_2 = List.new()
    end
    
    it "Comprobando el metodo all con una lista CON contenido" do
      expect(@lista_1.all?).to eq(true)
    end
    
    it "Comprobando el metodo all con una lista SIN contenido" do
      expect(@lista_2.all?).to eq(false)
    end
    
    it "Comprobando el metodo any con una lista CON contenido" do
      expect(@lista_1.any?).to eq(true)
    end
    
    it "Comprobando el metodo any con una lista SIN contenido" do
      expect(@lista_2.any?).to eq(false)
    end
    
    it "Comprobando min" do
      expect(@lista_1.min).to eq(2)
    end
    
    it "Comprobando max" do
      expect(@lista_1.max).to eq(9)
    end
    
    it "Metodo sort" do
      expect(@lista_1.sort).to eq([2,3,7,8,9])
    end
  end
end
