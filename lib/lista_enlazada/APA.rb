class Apa < List
    def initialize()
        @lista = List.new()
    end
    
    def add_elementos(x)
        @lista.add_varios(x)
    end
end