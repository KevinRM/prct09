class Referencia
   def initialize(autor,titulo,publicacion)
       @autor = autor
       @titulo = titulo
       @publicacion = publicacion
   end
   
   def get_autor
       @autor
   end
   
   def get_titulo
       @titulo
   end
   
   def get_publicacion
       @publicacion
   end
end

class Libro < Referencia
    def initialize(autor,titulo,publicacion,isbn)
        super(autor,titulo,publicacion)
        @isbn = isbn
    end
    
    def get_isbn()
        @isbn
    end
end

class Revista < Referencia
    def initialize(autor,titulo,publicacion,issn)
        super(autor,titulo,publicacion)
        @issn = issn
    end
    
    def get_issn()
        @issn
    end
end

class Periodico < Referencia
    def initialize(autor,titulo,publicacion,lugar)
        super(autor,titulo,publicacion)
        @lugar = lugar
    end
    
    def get_lugar()
        @lugar
    end
end