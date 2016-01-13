require './gilded_rose.rb'
require "rspec"

describe GildedRose do
  describe "#update_quality" do
    let!(:gilded_rose)  { GildedRose.new }
    
    before do
      gilded_rose.update_quality
    end

    context "passed sell data" do
      it "degrades twice as fast" do
        sulfuras_of_ragnaros = gilded_rose.items[3]
        expect(sulfuras_of_ragnaros.quality).to eql 80
      end
    end

    context "quality is never negative" do
      it "is never negative" do
        negative_values = gilded_rose.items.select { |item| item.quality < 0 }
        expect(negative_values.size).to eql 0
      end
    end

    context "Aged Brie" do
      it "will increase it's quality" do
        aged_brie = gilded_rose.items[2]
        expect(aged_brie.quality > 0).to eq(true)
      end
    end

    context "quality is never greated that 50" do
      it "must be less or equal then 50" do
        negative_values = gilded_rose.items.select { |item| item.quality > 50 }
        expect(negative_values.size).to eql 1
      end
    end

    context "Sulfuras" do
      it "never be sold" do
        sulfuras_of_ragnaros = gilded_rose.items[3]
        expect(sulfuras_of_ragnaros.sell_in >= 0).to eq(true)
      end
    end

    context "Backstage passes" do
        it "increase quality to 21" do
          backstage_passes = gilded_rose.items[4]
          expect(backstage_passes.quality).to eql 21
        end

        it "increase quality to 27" do
          5.times { gilded_rose.update_quality }
          backstage_passes = gilded_rose.items[4]
          expect(backstage_passes.quality).to eql 27
        end

        it "increase quality to 38" do
          10.times { gilded_rose.update_quality }
          backstage_passes = gilded_rose.items[4]
          expect(backstage_passes.quality).to eql 38
        end
    end

    context "expired item" do
      before do
        gilded_rose.items << Item.new("Magic wand", 0, 10)
        gilded_rose.update_quality
      end

      it "should decrease quality by 1" do
        magic_wand = gilded_rose.items[6]
        expect(magic_wand.quality).to eql 8
      end
    end
  end
end
