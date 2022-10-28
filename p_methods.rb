require 'pry'

class Cat
    attr_accessor :name 

    def initialize(name, ss)
        @name = name
        @ss = ss
    end

    def ss_number
        read_ss
    end

    private 
    def read_ss
        @ss 
    end

end

binding.pry