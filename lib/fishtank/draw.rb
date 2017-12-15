require 'rasem'

module FishTank

  module Draw

    @offset_x = 0
    @offset_y = 0

    @img = Rasem::SVGImage.new(width: 2000, height: 2000, 'font-size'.to_sym => '8') 

    # Draw the tank
    def self.tank(tank: nil, attributes: [:cells] ) 
      raise 'tank please' if tank.nil?

      tank.taxa.each do |t|
        attributes.each do |a|
          render_taxon(t, a)

          @img.text(@offset_x, @offset_y + t.pic_height + 2) do 
            raw a
          end 

          @offset_x += t.pic_width + 10
        end

        @img.text(0, @offset_y + t.pic_height + 15) do
          raw t.label 
        end 

        @offset_x = 0
        @offset_y += t.pic_height + 40 
      end  

      puts @img.to_s
    end

    def self.render_taxon(taxon, attribute)
      taxon.description.each do |entity, v|
        s = { 
          fill: svg_color(taxon, entity, attribute), 
          stroke: svg_color(taxon, entity, :otus), # for now we hard code stroke 
          'stroke-width'.to_sym => '0.5'
        }

        draw_part( v[0] + @offset_x, v[1] + @offset_y, v[2], v[3], style: s )
        if taxon.symmetry.keys.include?(entity)
          z = taxon.symmetry[entity]  
          draw_part( z[0] + @offset_x, z[1] + @offset_y, z[2], z[3], style: s )
        end

      end
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



