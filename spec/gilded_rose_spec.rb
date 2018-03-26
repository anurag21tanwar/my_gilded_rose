require_relative '../lib/gilded_rose'

describe "#update_quality" do

  context "with a single item" do
    let(:item) { Item.new(name, initial_sell_in, initial_quality) }

    before { update_quality([item]) }

    context "for normal item" do
      let(:name) { "NORMAL ITEM" }
      let(:initial_sell_in) { 5 }
      let(:initial_quality) { 10 }

      context "before sell date" do
        it do
          expect(item.quality).to eq(initial_quality - 1)
        end
      end

      context "on zero sell date" do
        let(:initial_sell_in) { 0 }
        it do
          expect(item.quality).to eq(initial_quality - 2)
        end
      end

      context "after sell date" do
        let(:initial_sell_in) { -1 }
        it do
          expect(item.quality).to eq(initial_quality - 2)
        end
      end

      context "on zero quality" do
        let(:initial_quality) { 0 }
        it do
          expect(item.quality).to eq(0)
        end
      end
    end
  end

  context "with multiple items" do
    let(:items) {
      [
          Item.new("NORMAL ITEM", 5, 10)
      ]
    }

    before { update_quality(items) }

    it do
      expect(items[0].quality).to eq(9)
      expect(items[0].sell_in).to eq(4)
    end
  end
end
