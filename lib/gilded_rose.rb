require_relative '../lib/quality'

def update_quality(items)
  items.each do |item|
    case item.name
      when 'Sulfuras, Hand of Ragnaros'
        Quality::SulfurasItems.new.update(item)
      when 'Aged Brie'
        Quality::AgedBrieItems.new.update(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        # make backstage class
      when 'Conjured'
        # make conjured class
      else
        Quality::NormalItems.new.update(item)
    end
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)
