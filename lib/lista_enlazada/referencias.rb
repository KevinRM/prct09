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