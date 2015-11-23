Node = Struct.new(:value, :prev, :next)

class List
    include Enumerable
    attr_accessor :cabeza, :cola
    
    def initialize()
        @cabeza = nil
        @cola = nil
    end
    
    def add_nodo(x)
        nodo = Node.new(x,nil,nil)
        
        if(@cabeza == nil && @cola == nil)
            @cabeza = nodo
            @cola = nodo
        else
            @cabeza.next = nodo
            nodo.prev = @cabeza
            @cabeza = nodo
        end
    end
    
    def add_varios(x)
        x.each do |valor|
            add_nodo(valor)
        end
    end
    
    def get_nodo()
        x = @cola
        @cola = @cola.next
        @cola.prev = nil
        
        x.next = nil
        return x.value
    end
    
    def each
        if(@cabeza == nil && @cola == nil)
            yield nil
        elsif(@cabeza != @cola)
            while (@cola != nil)
                yield @cola.value
                @cola = @cola.next
            end
        else
            yield @cabeza.value
        end
    end
end