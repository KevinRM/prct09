class Referencia
    include Comparable
    def initialize(autor,titulo,publicacion)
        @autor = autor
        @titulo = titulo
        @publicacion = publicacion
    end
   
    def get_autor
         @autor.each do |valor|
            valor
        end
    end
   
    def get_titulo
        @titulo
    end
   
    def get_publicacion
        @publicacion
    end
    
    def <=> (other)
        @titulo <=> other.get_titulo()
    end
end

class Libro < Referencia
    def initialize(autor,publicacion,titulo,editor)
        super(autor,titulo,publicacion)
        @editor = editor
    end
    
    def get_editor()
        @editor
    end
end

class Revista < Referencia
    def initialize(autor,publicacion,titulo,editor)
        super(autor,titulo,publicacion)
        @editor = editor
    end
    
    def get_editor()
        @editor
    end
end

class Periodico < Referencia
    def initialize(autor,publicacion,titulo,periodico)
        super(autor,titulo,publicacion)
        @periodico = periodico
    end
    
    def get_periodico()
        @periodico
    end
end

class Doc_elect < Referencia
    def initialize(autor,publicacion,titulo,lugar,medio)
        super(autor,titulo,publicacion)
        @lugar = lugar
        @medio = medio
    end
    
    def get_lugar()
        @lugar
    end
    
    def get_medio()
        @medio
    end
end