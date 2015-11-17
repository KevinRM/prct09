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