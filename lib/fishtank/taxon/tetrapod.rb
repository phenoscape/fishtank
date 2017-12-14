module FishTank

  # Generic Tetrapod
  class Taxon::Tetrapod < FishTank::Taxon

    # Ugh
    def description
      return {
        'UBERON_0001703' =>  [10, 0, 10, 9],   # 'neurocranium'
        'UBERON_0000970' =>  [8, 3, 4, 4],     # 'eye'
        'UBERON_0001708' =>  [12, 0, 4, 2],    # 'jaw skeleton' 
        'UBERON_0002090' =>  [10, 10, 10, 30], # 'post-cranial axial skeleton'   / body
        'UBERON_0003097' =>  [0, 16, 10, 6],   # 'dorsal fin'                    / left front
        'UBERON_0000151' =>  [0, 26, 10, 6],   # 'pectoral fin'                  / left rear
        'UBERON_4000164' =>  [13, 40, 3, 15],  # 'caudal fin'                    / tail
      }
    end

    def symmetry
      return {
        'UBERON_0000970' => [18, 3, 4, 4],
        'UBERON_0003097' => [20, 16, 10, 6],
        'UBERON_0000151' => [20, 26, 10, 6]
      } 
    end

  end
end
