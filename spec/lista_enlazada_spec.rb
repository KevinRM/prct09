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
      @objeto_referencia = Referencia.new(["Rivero Kevin"],"titulo_referencia","17-11-2015")
    end
    
    it "La clase referencia tiene un autor" do
      expect(@objeto_referencia.get_autor()).to eq(["Rivero Kevin"])
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
      @objeto_libro = Libro.new(["Estebez Kevin_libro"],"17-11-2015_libro","titulo_libro","Anaya")
    end
    
    it "Es un objeto de herencia de la clase Referencia" do
      expect(@objeto_libro).is_a? Referencia
    end
    
    it "No es un objeto de la clase Revista" do
      expect(@objeto_elect.respond_to? "Revista").to eq false
    end
    
    it "Libro tiene un Autor" do
      expect(@objeto_libro.get_autor()).to eq(["Estebez Kevin_libro"])
    end
    
    it "Libro tiene un editor" do
      expect(@objeto_libro.get_editor()).to eq("Anaya")
    end
  end
  
  context "Pruebas para la clase de herencia Revista" do
    before :each do
      @objeto_revista = Revista.new(["Exposito Kevin_revista"],"17-11-2015_revista","titulo_revista","Zalman")
    end
    
    it "Es un objeto de herencia de la clase Referencia" do
      expect(@objeto_revista).is_a? Referencia
    end
    
    it "No es un objeto de la clase Libro" do
      expect(@objeto_elect.respond_to? "Libro").to eq false
    end
    
    it "Revista tiene un Autor" do
      expect(@objeto_revista.get_autor()).to eq(["Exposito Kevin_revista"])
    end
    
    it "Revista tiene un editor" do
      expect(@objeto_revista.get_editor()).to eq("Zalman")
    end
  end
  
  context "Pruebas para la clase de herencia Periodico" do
    before :each do
      @objeto_periodico = Periodico.new(["Perez Kevin_periodico"],"17-11-2015_periodico","titulo_periodico","Apuron")
    end
    
    it "Es un objeto de herencia de la clase Referencia" do
      expect(@objeto_periodico).is_a? Referencia
    end
    
    it "No es un objeto de la clase Revista" do
      expect(@objeto_elect.respond_to? "Revista").to eq false
    end
    
    it "Periodico tiene un Autor" do
      expect(@objeto_periodico.get_autor()).to eq(["Perez Kevin_periodico"])
    end
    
    it "Periodico tiene un periodico" do
      expect(@objeto_periodico.get_periodico()).to eq("Apuron")
    end
  end
  
  context "Pruebas para la clase de herencia documento Electronico" do
    before :each do
      @objeto_elect = Doc_elect.new(["Astro Kevin_documento_electronico"],"17-11-2015_documento_electronico","titulo_electronico","https://periodico.com","Web")
    end
    
    it "Es un objeto de herencia de la clase Referencia" do
      expect(@objeto_elect).is_a? Referencia
    end
    
    it "No es un objeto de la clase Periodico" do
      expect(@objeto_elect.respond_to? "Periodico").to eq false
    end
    
    it "Documento electronico tiene un Autor" do
      expect(@objeto_elect.get_autor()).to eq(["Astro Kevin_documento_electronico"])
    end
    
    it "Documento electronico tiene un lugar" do
      expect(@objeto_elect.get_lugar()).to eq("https://periodico.com")
    end
  end
  
  context "Comparaciones entre dos referencias bibliograficas por titulo" do
    before :each do
      @libro_1 = Libro.new(["Martinez Escoba"],"23-11-2015","Ave","Campitos")
      @libro_2 = Libro.new(["Flores Marta"],"23-11-2015","Estampa","SP")
      @revista_1 = Revista.new(["Estebez Lola"],"4-5-2008","Comidas","ZWQ")
      @doc_elect_1 = Doc_elect.new(["Fernandez Abian"],"5-1-1800","Willson","https://periodico.com/willson","Web")
    end
    
    it "El autor de libro Ave es menor que el autor de libro Estampa" do
      expect(@libro_1 < @libro_2).to eq(false)
    end
    
    it "El autor de libro Estampa es menor que el autor de libro Ave" do
      expect(@libro_1 > @libro_2).to eq(true)
    end
    
    it "El autor de Revista Comidas es menor o igual que el autor de libro Estampa" do
      expect(@revista_1 <= @libro_2).to eq(true)
    end
    
    it "El autor de Documento electronico Willson es mayor o igual que el autor de Revista Comidas" do
      expect(@doc_elect_1 >= @revista_1).to eq(true)
    end
    
    it "El autor de libro Ave es igual al autor de libro Ave" do
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
    
    it "Metodo drop" do
      expect(@lista_1.drop(2)).to eq([7,9,8])
    end
    
    it "Metodo detect" do
      expect(@lista_1.detect{|i| i == 7}).to eq(7)
    end
    
    it "Metodo find" do
      expect(@lista_1.find{|i| i == 3}).to eq(3)
    end
    
    it "Metodo count" do
      expect(@lista_1.count).to eq(5)
    end
    
    it "Metodo map" do
      expect(@lista_1.map{|i| i*i}).to eq([9,4,49,81,64])
    end
    
    it "Metodo collect" do
      expect(@lista_1.collect{|i| i+i}).to eq([6,4,14,18,16])
    end
  end
  
  context "Lista de referencias en formato APA" do
    before :all do
      @libro_3 = Libro.new(["Pepe Martinez", "Sandra Flores"],"2008","Esto es un libro","Fuentes")
      @revista_2 = Revista.new(["Fausto Lopez","Marta Isciiio"],"2001","esto es una revista","ZWQ")
      @periodico_1 = Periodico.new(["Pepa Locutora","Fausto Lopez"],"2015","Esto es un periodico","Tenerife_periodico")
      @doc_elect_2 = Doc_elect.new(["Marta Isciiio","Flora Martinez"],"1960","Esto es un documento electronico","https://martaweb.com","Web")
      
      @lista = List.new()
      @lista.add_varios([@libro_3,@revista_2,@periodico_1,@doc_elect_2])
      
      @apa = Apa.new(@lista)
    end
    
    it "Obtener autores" do
      expect(@apa.get_autores(@libro_3.get_autor())).to eq(["Martinez Pepe", "Flores Sandra"])
    end
    
    it "Las entradas de la lista deben estar ordenadas alfabeticamente por el apellido del primer autor de cada trabajo" do
      expect(@apa.ordenar_autores()).to eq(nil)
    end
    
    it "Lista ordenada por el primer apellido del primer autor o por fecha de publicacion" do
      @libro_3 = Libro.new(["Martinez Pepe", "Flores Sandra"],"2008","Esto es un libro","Fuentes")
      @revista_2 = Revista.new(["Lopez Fausto","Marta Isciiio"],"2001","esto es una revista","ZWQ")
      @periodico_1 = Periodico.new(["Locutora Pepa","Fausto Lopez"],"2015","Esto es un periodico","Tenerife_periodico")
      @doc_elect_2 = Doc_elect.new(["Isciiio Marta","Martinez Flora"],"1960","Esto es un documento electronico","https://martaweb.com","Web")
      @lista_auxiliar = List.new()
      @lista_auxiliar.add_varios([@doc_elect_2,@periodico_1,@revista_2,@libro_3])
      
      expect(@apa.ordenar_lista()).to eq([@doc_elect_2,@periodico_1,@revista_2,@libro_3])
    end
    
    it "Apersand en lugar de y o and" do
      expect(@apa.ampersand(@libro_3.autor)).to eq("Martinez Pepe & Flores Sandra")
    end
    
    it "Sangria francesa" do
      expect(@apa.to_s).to eq("     Isciiio Marta, Martinez Flora")
    end
    
    it "Poner en mayuscula el inicio del titulo de revista" do
      @revista_3 = Revista.new(["Lopez Fausto","Marta Isciiio"],"2001","Esto es una revista","ZWQ")
      expect(@apa.poner_mayuscula(@revista_2)).to eq(@revista_3)
    end
  end
end
