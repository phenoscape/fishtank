require 'rasem'

module FishTank
  module Draw

    @offset_x = 0
    @offset_y = 0

    @img = Rasem::SVGImage.new(width: 100, height: 100) 

    def self.tank(tank: nil, attribute1: :cells, attribute2: :otus ) 
      raise 'tank please' if tank.nil?
      tank.taxa.each do |t|
        render_taxon(t, attribute1, attribute2)
      end  
    end

    def self.render_taxon(taxon, attribute1, attribute2)
      taxon.description.each do |entity, v|
        s = { 
          fill: svg_color(taxon, entity, attribute1), 
          stroke: svg_color(taxon, entity, attribute2), 
          'stroke-width'.to_sym => '0.5'
        }

        draw_part( v[0] + @offset_x, v[1] + @offset_y, v[2], v[3], style: s )
        if taxon.symmetry.keys.include?(entity)
          z = taxon.symmetry[entity]  
          draw_part( z[0] + @offset_x, z[1] + @offset_y, z[2], z[3], style: s )
        end

        @offset_x += taxon.pic_width
        @offset_y += taxon.pic_height
      end
      
      puts @img.to_s
    end

    def self.draw_part(x, y, width, height, style: {})
      @img.rectangle x, y, width, height, style: style
    end

    def self.svg_color(taxon, entity, attribute)
      v = (taxon.stats[entity][:crunched][attribute] * 255).to_i
      "rgb(#{v}, 0, 0)"
    end

  end
end



