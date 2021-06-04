class GildedRose

  def initialize(items)
    @items = items
  end

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  MAX_QUALITY = 50

  def update_quality
    @items.each do |item|
      return if item.name == SULFURAS

      if quality_increases_over_time?(item)
        increase_quality(item)

        if item.name == BACKSTAGE_PASS
          increase_quality(item) if item.sell_in < 11
          increase_quality(item) if item.sell_in < 6
        end
      else
        decrease_quality(item)
      end

      item.sell_in = item.sell_in - 1

      update_expired_quality(item) if item.sell_in < 0
    end
  end

  private

  def quality_increases_over_time?(item)
    item.name == AGED_BRIE || item.name == BACKSTAGE_PASS
  end

  def update_expired_quality(item)
    if item.name == AGED_BRIE
      increase_quality(item)
    else
      if item.name == BACKSTAGE_PASS
        item.quality = item.quality - item.quality
      else
        decrease_quality(item)
      end
    end
  end

  def decrease_quality(item)
    item.quality = item.quality - 1 if item.quality > 0
  end

  def increase_quality(item)
    item.quality = [item.quality + 1, MAX_QUALITY].min
  end
end

class Item
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
