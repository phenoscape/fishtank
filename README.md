
# Fishtank

This library uses the [phenoscaperb](https://github.com/phenoscape/phenoscaperb) gem to query the [Phenoscape API](http://kb.phenoscape.org/apidocs/) for basic statistics on a taxon, entity, and quality basis.  It then renders the results as an SVG visualization.

# Basic use

In `your_file.rb` :

```
require './lib/fishtank'

fish = 'VTO_0037519'
lizard = 'VTO_9007513' 
pan = 'VTO_0011989'
homininae = 'VTO_0011988'

# Create a new tank
tank = FishTank::Tank.new

# Make some Taxa
t = FishTank::Taxon::Arm.new(label: homininae)
f = FishTank::Taxon::Fish.new(label: fish)
v = FishTank::Taxon::Tetrapod.new(label: lizard)

# Add the Taxa to the tank
tank.add(t)
tank.add(f)
tank.add(v)

# Render the tank
FishTank::Draw.tank(tank: tank, attributes: FishTank::QUALITIES)
```

Then in the terminal:

```
ruby your_file.rb > index.html
open index.html
```

# About, thanks.

Concieved and implemented at the  [2017 Phenoscape KB-DataFest](https://github.com/phenoscape/KB-DataFest-2017). Special thanks to Wasila Dahdul for her help with the taxon models and Scott Chamberlain for phenoscaperb.

# License

MIT

