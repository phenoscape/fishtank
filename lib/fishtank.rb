


require 'phenoscaperb'
require 'awesome_print'
require 'byebug'

require "fishtank/version"

require 'fishtank/draw'
require 'fishtank/simple_nexml'
require 'fishtank/tank'
require 'fishtank/taxon'
require 'fishtank/taxon/fish'
require 'fishtank/taxon/tetrapod'
require 'fishtank/taxon/arm'


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
