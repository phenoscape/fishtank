WIP

# Fishtank

Experiments in visualizing phenotype data on an organism.

# Basic use

```
require './lib/fishtank'
require 'byebug'

fish = 'VTO_0037519'
lizard = 'VTO_9007513' 
pan = 'VTO_0011989'
homininae = 'VTO_0011988'

tank = FishTank::Tank.new(target_attributes: ['PATO_0000052', 'PATO_0000117']) 

t = FishTank::Taxon::Arm.new(label: homininae)

tank.add(t)

FishTank::Draw.tank(tank: tank, attribute1: 'PATO_0000052', attribute2: :cells)
```

# License

MIT

