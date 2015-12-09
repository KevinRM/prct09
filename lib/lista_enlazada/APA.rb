class Apa < List
    def initialize()
        @lista = List.new()
    end
    
    def add_elementos(x)
        @lista.add_varios(x)
    end
    
    def get_autores()
        valor_nodo = @lista.get_nodo()
        autores = valor_nodo.get_autor()
        array_devolver = []
        i = 0
        autores.each do |val|
            autor = val.split(' ')
            array_devolver[i] = autor[1] + " " + autor[0]
            i += 1
        end
        return array_devolver
    end
end