class Item

  attr_accessor :name, :sell_in, :quality
        
  def initialize (name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def legendary?
    @name == "Sulfuras, Hand of Ragnaros"
  end

  def expired?
    @sell_in < 0
  end

  def backstage_passes?
    @name == "Backstage passes to a TAFKAL80ETC concert"
  end
end
