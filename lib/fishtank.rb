
require 'rasem'
require 'phenoscaperb'
require 'awesome_print'
require 'byebug'

require_relative './fishtank/draw.rb'
require_relative './fishtank/simple_nexml.rb'
require_relative './fishtank/tank.rb'
require_relative './fishtank/taxon.rb'
require_relative './fishtank/taxon/fish.rb'
require_relative './fishtank/taxon/tetrapod.rb'
require_relative './fishtank/taxon/arm.rb'


module FishTank

  BASE = 'http://purl.obolibrary.org/obo/'

  # TODO: move to file
  QUALITIES = [ 
    'PATO_0000052',  # shape
    'PATO_0000117',  # size
    'PATO_0000014',  # color
    'PATO_0000070',  # count/amount
    'PATO_0000140'   # position
  ] 

  def self.attributes
    QUALITIES + [:otus, :rows, :cells]
  end

end
