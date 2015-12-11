class Apa
    require "lista_enlazada.rb"
    require "lista_enlazada/referencias.rb"
    
    def initialize(lista)
        @lista = List.new()
        @lista = lista
        @lista_2 = List.new()
    end
    
    def get_autores(autores)
        array_devolver = []
        i = 0
        autores.each do |val|
            autor = val.split(' ')
            array_devolver[i] = autor[1] + " " + autor[0]
            i += 1
        end
        return array_devolver
    end
    
    def ordenar_autores
        while (@lista.cabeza != nil && @lista.cola != nil)
            nodo_valor = @lista.get_nodo()
            nodo_autores = nodo_valor.get_autor()
            nodo_valor.autor = get_autores(nodo_autores)
            @lista_2.add_nodo(nodo_valor)
        end
    end
    
    def ordenar_lista
        @lista_2.sort
    end
    
    def ampersand(autores)
        nombres = []
        nombres = autores.join(" & ")
        return nombres
    end
    
    def poner_mayuscula(revista)
        if(revista.is_a? Revista)
            revista.titulo = revista.titulo.capitalize
            return revista
        end
    end
    
    def to_s
        nodo_lista = @lista_2.cabeza.value
        valor_nodo = nodo_lista.get_autor()
        cadena = "#{valor_nodo.join(", ")}"
        
        return cadena.rjust(cadena.length + 5)
    end
end