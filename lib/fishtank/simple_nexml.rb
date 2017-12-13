# TODO: this doesn't belong in this repo

require 'nokogiri'

# Parse NeXML document and return some data
class SimpleNexml

  attr_accessor :doc
  attr_accessor :taxon
  attr_accessor :entity

  def initialize(doc: nil, taxon: nil, entity: nil)
    @doc = doc
  end

  def stats
    return {
      count: {
        otus: otus.count,
        rows: rows.count,
        cells: cells.count
      }
    }
  end

  def otus
    doc.css("otus")
  end

  def cells
    doc.css("cell")
  end

  def rows
    doc.css("row")
  end

  # @return [Array]
  #   all chars referenced in rows
  def referenced_chars
    cells.inject({}) {|hsh, c| hsh.merge!(c.to_h['char'] => nil)}.keys
  end

  # @return [Array]
  #   all states referenced in rows
  def referenced_states
    cells.inject({}) {|hsh, c| hsh.merge!(c.to_h['state'] => nil)}.keys
  end

  # @return [Array]
  #   all chars referenced in rows
  def referenced_otus
    rows.css("row").inject({}) {|hsh, c| hsh.merge!(c.to_h['otu'] => nil)}.keys
  end

end


