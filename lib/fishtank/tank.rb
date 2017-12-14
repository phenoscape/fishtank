
module FishTank

  class Tank
    attr_accessor :taxa

    attr_accessor :attributes

    def initialize(target_attributes: [])
      @taxa = []
      @attributes = target_attributes 
    end

    def add(taxon)
      @taxa.push(taxon)
    end
  end

end

