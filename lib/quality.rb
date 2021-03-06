module Quality

  class Base
    def update(item)
      set_quality(item)
      set_sell_in(item)
    end

    def set(item, value)
      if item.quality >= 50
        item.quality = 50
      elsif item.quality <= 0
        item.quality = 0
      else
        item.quality += value
      end
    end

    def set_sell_in(item)
      item.sell_in -= 1
    end
  end

  class NormalItems < Quality::Base
    def set_quality(item)
      item.sell_in <= 0 ? set(item, -2) : set(item, -1)
    end
  end

  class SulfurasItems < Quality::Base
    def set_quality(item)
    end

    def set_sell_in(item)
    end
  end

  class AgedBrieItems < Quality::Base
    def set_quality(item)
      item.sell_in <= 0 ? set(item, 2) : set(item, 1)
    end
  end

  class BackStageItems < Quality::Base
    def set_quality(item)
      if item.sell_in > 10
        set(item, 1)
      elsif item.sell_in > 5
        set(item, 2)
      elsif item.sell_in > 0
        set(item, 3)
      else
        item.quality = 0
      end
    end
  end

  class ConjuredItems < Quality::Base
    def set_quality(item)
      item.sell_in <= 0 ? set(item, -4) : set(item, -2)
    end
  end
end
