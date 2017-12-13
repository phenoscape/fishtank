
require 'rasem'
require 'phenoscaperb'
require 'awesome_print'

require_relative 'simple_nexml.rb'

require 'byebug'

class FishTank
  BASE = 'http://purl.obolibrary.org/obo/'

  # TODO: move to file
  QUALITIES = [ 
   'PATO_0000052',  # shape
   'PATO_0000117',  # size
   'PATO_0000014',  # color
   'PATO_0000070',  # count/amount
   'PATO_0000140'   # position
  ] 

  METADATA = {
    'UBERON_0001703' =>  [0, 10, 10, 10],  # 'neurocranium'
    'UBERON_0000970' =>  [3, 12, 3, 3],    # 'eye'
    'UBERON_0001708' =>  [1, 17, 5, 2],    # 'jaw skeleton'
    'UBERON_0002090' =>  [10, 10, 30, 10], # 'post-cranial axial skeleton'
    'UBERON_0003097' =>  [12, 0, 10, 10],  # 'dorsal fin'
    'UBERON_0000151' =>  [5, 20, 10, 10],  # 'pectoral fin'
    'UBERON_0000152' =>  [17, 20, 10, 10], # 'pelvic fin'
    'UBERON_4000164' =>  [30, 5, 10, 20],  # 'caudal fin'
  }

  # the svg image object
  attr_accessor :img

  attr_accessor :parent_taxon

  # All observed descendants of the parent_taxon
  attr_accessor :children

  attr_accessor :taxon_stats

  def initialize(taxon: nil)
    raise 'the tank is empty, sad, and lonely, give it a fish, like "taxon: 123"' if taxon.nil?
    @img = Rasem::SVGImage.new(width: 100, height: 100) 
    @parent_taxon = taxon 
    @taxon_stats = {}
    @all_otus = []
  end

  def render
  end

  def render_fish(taxon)
    get_metadata(taxon) 

    METADATA.each do |entity, v|
      draw_fish_part(
        v[0], v[1], v[2], v[3], 
        style: { 
          fill: svg_color(taxon, entity, :cells), 
          stroke: svg_color(taxon, entity, :rows), 
          'stroke-width'.to_sym => '0.5'
        }
      )
    end
    puts img.to_s
  end

  def svg_color(taxon, entity, attribute)
    "rgb(#{(taxon_stats[taxon][entity][:crunched][attribute] * 255).to_i}, 0, 0)"
  end

  def draw_fish_part(x, y, width, height, style: {})
    img.rectangle x, y, width, height, style: style
  end

  # @return [XML]
  def get_nexml(taxon, entity)
    Phenoscape::Ontotrace.ontotrace(taxon: iri_for(taxon), entity: some_iri(entity), ret: 'noko')
  end

  def get_metadata(taxon)
    @taxon_stats[taxon] ||= {}
    METADATA.each do |k, v|
      @taxon_stats[taxon][k] ||= {}
      @taxon_stats[taxon][k][:raw] ||= {}

      xml = get_nexml(taxon, k) 
      o = SimpleNexml.new(doc: xml, taxon: taxon)
      @taxon_stats[taxon][k][:raw] = o.stats[:count]
    end

    crunch_stats(taxon)
  end

  def crunch_stats(taxon)
    totals = { otus: 0, rows: 0, cells: 0}

    taxon_stats[taxon].keys.each do |entity|
      taxon_stats[taxon][entity][:raw].each do |k, count|
        totals[k] += count 
      end 
    end

    METADATA.each do |entity, v|
      taxon_stats[taxon][entity][:crunched] ||= {}
      totals.keys.each do |t|
        taxon_stats[taxon][entity][:crunched][t] = taxon_stats[taxon][entity][:raw][t].to_f / totals[t].to_f
      end
    end
  end

  def get_all_metadata
    get_metadata(parent_taxon)
  end

  def some_iri(entity)
    iri_for('BFO_0000050') + ' some ' +  iri_for(entity) 
  end

  def iri_for(id)
    '<' + BASE + id + '>'
  end

end



# f.get_all_metadata

# curl -X GET "http://kb.phenoscape.org/api/taxon/annotations?entity=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FUBERON_0001703&quality=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FPATO_0000052&in_taxon=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FVTO_0037519&parts=true&historical_homologs=false&serial_homologs=false&limit=20&offset=0&total=true" -H  "accept: application/json"
