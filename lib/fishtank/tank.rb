
module FishTank

  class Tank
    attr_accessor :taxa

    def initialize
      @taxa = []
    end

    def add(taxon)
      @taxa.push(taxon)
    end
  end

end

