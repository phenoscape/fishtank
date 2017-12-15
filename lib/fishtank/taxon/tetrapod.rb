module FishTank

  # Generic Tetrapod
  class Taxon::Tetrapod < FishTank::Taxon

    # TODO: Update UBERON terms to represent actually meaningful layout, this was cloned from Fish
    def description
      return {
       'UBERON_0001703' =>  [10, 0, 10, 9],    # 'neurocranium'
       'UBERON_0000970' =>  [8, 3, 4, 4],      # 'eye'
       'UBERON_0001708' =>  [12, 0, 4, 2],     # 'jaw skeleton' 
       'UBERON_0014477' =>  [10, 10, 10, 30],  # thoracic skeleton
       'UBERON_0002102' =>  [0, 16, 10, 6],    # forelimb 
       'UBERON_0002103' =>  [0, 26, 10, 6],    # hindlimb 
       'UBERON_0002415' =>  [13, 40, 3, 15],   # tail 
      }
    end

    def symmetry
      return {
       'UBERON_0000970' => [18, 3, 4, 4],
       'UBERON_0002102' => [20, 16, 10, 6],
       'UBERON_0002103' => [20, 26, 10, 6]
      } 
    end

    def pic_height
      75
    end

  end
end
