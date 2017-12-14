
module FishTank
  class Taxon::Fish < FishTank::Taxon

    # Ugh
    def description
      return {
        'UBERON_0001703' =>  [0, 10, 10, 10],  # 'neurocranium'
        'UBERON_0000970' =>  [3, 12, 3, 3],    # 'eye'
        'UBERON_0001708' =>  [1, 17, 5, 2],    # 'jaw skeleton'
        'UBERON_0002090' =>  [10, 10, 30, 10], # 'post-cranial axial skeleton'
        'UBERON_0003097' =>  [12, 0, 10, 10],  # 'dorsal fin'
        'UBERON_0000151' =>  [5, 20, 10, 10],  # 'pectoral fin'
        'UBERON_0000152' =>  [17, 20, 10, 10], # 'pelvic fin'
        'UBERON_4000164' =>  [30, 5, 10, 20],  # 'caudal fin'
      }
    end

  end
end
