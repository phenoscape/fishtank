module FishTank
  class Taxon

    # METADATA = {}

    attr_accessor :label 
    attr_accessor :stats

    def initialize(taxon_id: nil)
      @label = taxon_id 
      @stats = {}
      get_metadata
      crunch_stats
    end

    # @return [XML]
    def get_nexml(entity)
      Phenoscape::Ontotrace.ontotrace(taxon: iri_for(label), entity: some_iri(entity), ret: 'noko')
    end

    # @return [Integer]
    def get_phenotype_total(entity, quality)
      Phenoscape::Taxa.annotations(
        in_taxon: base_for(label), 
        entity: base_for(entity), 
        quality: base_for(quality),
        total: true,
        parts: true
      )['total']
    end

    def get_metadata
      @stats ||= {}
      description.each do |k, v|
        @stats[k] ||= {}
        @stats[k][:raw] ||= {}

        xml = get_nexml(k) 
        o = SimpleNexml.new(doc: xml, taxon: label)
        @stats[k][:raw] = o.stats[:count]

        FishTank::QUALITIES.each do |q|
          @stats[k][:raw][q] = get_phenotype_total(k, q)
        end
      end
      true 
    end

    def crunch_stats
      totals = {} 

      stats.keys.each do |entity|
        stats[entity][:raw].each do |k, count|
          totals[k] ||= 0
          totals[k] += count 
        end 
      end

      description.each do |entity, v|
        stats[entity][:crunched] ||= {}
        totals.keys.each do |t|
          v = totals[t] == 0 ? 0.to_f : stats[entity][:raw][t].to_f / totals[t].to_f
          stats[entity][:crunched][t] = v 
        end
      end
      true
    end

    def some_iri(entity)
      iri_for('BFO_0000050') + ' some ' +  iri_for(entity) 
    end

    def iri_for(id)
      '<' + base_for(id) + '>'
    end

    def base_for(id)
      BASE + id
    end

    def attributes
    end

    def symmetry
      return {}
    end

    # @return [Integer]
    def pic_width
      60 
    end

    # @return [Integer]
    def pic_height
      100
    end

  end

end


