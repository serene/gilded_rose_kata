class GildedRose

  def initialize(items)
    @items = items
  end

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  def update_quality
    @items.each do |item|
      if item.name != AGED_BRIE and item.name != BACKSTAGE_PASS
        decrease_quality(item)
      else
        if item.quality < Item::MAX_QUALITY
          item.quality = item.quality + 1

          if item.name == BACKSTAGE_PASS
            if item.sell_in < 11
              increase_quality(item)
            end
            
            if item.sell_in < 6
              increase_quality(item)
            end
          end
        end
      end

      item.sell_in = item.sell_in - 1 unless item.name == SULFURAS

      if item.sell_in < 0
        if item.name != AGED_BRIE
          if item.name != BACKSTAGE_PASS
            decrease_quality(item)
          else
            item.quality = item.quality - item.quality
          end
        else
          increase_quality(item)
        end
      end
    end
  end

  private

  def decrease_quality(item)
    if item.quality > 0
      if item.name != SULFURAS
        item.quality = item.quality - 1
      end
    end
  end

  def increase_quality(item)
    if item.quality < Item::MAX_QUALITY
      item.quality = item.quality + 1
    end
  end
end

class Item
  MAX_QUALITY = 50

  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
