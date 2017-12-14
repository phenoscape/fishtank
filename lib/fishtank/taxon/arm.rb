module FishTank

  # Generic Arm/limb 
  class Taxon::Arm < FishTank::Taxon

    def description
      return {
        'UBERON_0000976' =>  [15, 0, 10, 20],   # 'humerus'
        'UBERON_0001423' =>  [12, 22, 6, 20],   # 'radius'
        'UBERON_0001424' =>  [22, 22, 6, 20],   # 'ulna'
       
        'UBERON_0001435' =>  [10, 44, 20, 15 ], # 'carpal bone'
        'UBERON_0002374' =>  [8, 61, 24, 15 ],  # 'metacarpal bone'

        'UBERON_0006048' =>  [8,  78, 4, 10 ],  # 'digit 1'
        'UBERON_0006049' =>  [13, 78, 4, 10 ],  # 'digit 2'
        'UBERON_0006050' =>  [18, 78, 4, 10 ],  # 'digit 3'
        'UBERON_0006051' =>  [23, 78, 4, 10 ],  # 'digit 4'
        'UBERON_0006052' =>  [28, 78, 4, 10 ],  # 'digit 5'
       }
    end

  end
end
