require_relative '../lib/gilded_rose'

describe '#update_quality' do

  context 'with a single item' do
    let(:item) { Item.new(name, initial_sell_in, initial_quality) }

    before { update_quality([item]) }

    ######################################################################
    # NORMAL ITEM ########################################################
    ######################################################################
    context 'for normal item' do
      let(:name) { 'NORMAL ITEM' }
      let(:initial_sell_in) { 5 }
      let(:initial_quality) { 10 }

      context 'before sell date' do
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality - 1)
        end
      end

      context 'on zero sell date' do
        let(:initial_sell_in) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality - 2)
        end
      end

      context 'after sell date' do
        let(:initial_sell_in) { -1 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality - 2)
        end
      end

      context 'on zero quality' do
        let(:initial_quality) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(0)
        end
      end
    end

    ######################################################################
    # SULFURAS ITEM ######################################################
    ######################################################################
    context 'for sulfuras item' do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }
      let(:initial_sell_in) { 5 }
      let(:initial_quality) { 10 }

      context 'before sell date' do
        it do
          expect(item.sell_in).to eq(initial_sell_in)
          expect(item.quality).to eq(initial_quality)
        end
      end

      context 'on zero sell date' do
        let(:initial_sell_in) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in)
          expect(item.quality).to eq(initial_quality)
        end
      end

      context 'after sell date' do
        let(:initial_sell_in) { -1 }
        it do
          expect(item.sell_in).to eq(initial_sell_in)
          expect(item.quality).to eq(initial_quality)
        end
      end

      context 'on zero quality' do
        let(:initial_quality) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in)
          expect(item.quality).to eq(0)
        end
      end
    end

    ######################################################################
    # AGED BRIE ITEM #####################################################
    ######################################################################
    context 'for aged brie item' do
      let(:name) { 'Aged Brie' }
      let(:initial_sell_in) { 5 }
      let(:initial_quality) { 10 }

      context "before sell date" do
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality + 1)
        end
      end

      context "on zero sell date" do
        let(:initial_sell_in) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality + 2)
        end
      end

      context "after sell date" do
        let(:initial_sell_in) { -1 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality + 2)
        end
      end

      context 'on zero quality' do
        let(:initial_quality) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(0)
        end
      end

      context "on maximum quality" do
        let(:initial_quality) { 50 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality)
        end
      end
    end

    ######################################################################
    # BACKSTAGE ITEM #####################################################
    ######################################################################
    context "for backstage item" do
      let(:name) { "Backstage passes to a TAFKAL80ETC concert" }
      let(:initial_sell_in) { 5 }
      let(:initial_quality) { 10 }

      context "before sell date" do
        let(:initial_sell_in) { 20 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality + 1)
        end
      end

      context "on 7 days before sell date" do
        let(:initial_sell_in) { 7 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality + 2)
        end
      end

      context "on 3 days before sell date" do
        let(:initial_sell_in) { 3 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality + 3)
        end
      end

      context "on zero sell date" do
        let(:initial_sell_in) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(0)
        end
      end

      context "after sell date" do
        let(:initial_sell_in) { -1 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(0)
        end
      end

      context 'on zero quality' do
        let(:initial_quality) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(0)
        end
      end

      context "on maximum quality" do
        let(:initial_quality) { 50 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality)
        end
      end
    end

    ######################################################################
    # CONJURED ITEM ######################################################
    ######################################################################
    context "for conjured item" do
      let(:name) { "Conjured" }
      let(:initial_sell_in) { 5 }
      let(:initial_quality) { 10 }

      context "before sell date" do
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality - 2)
        end
      end

      context "on zero sell date" do
        let(:initial_sell_in) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality - 4)
        end
      end

      context "after sell date" do
        let(:initial_sell_in) { -1 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality - 4)
        end
      end

      context "on zero quality" do
        let(:initial_quality) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(0)
        end
      end
    end
  end

  context 'with multiple items' do
    let(:items) {
      [
          Item.new('NORMAL ITEM', 5, 10),
          Item.new('Sulfuras, Hand of Ragnaros', 5, 80),
          Item.new('Aged Brie', 5, 50),
          Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10),
          Item.new('Conjured', 5, 10)
      ]
    }

    before { update_quality(items) }

    it do
      expect(items[0].sell_in).to eq(4)
      expect(items[0].quality).to eq(9)

      expect(items[1].sell_in).to eq(5)
      expect(items[1].quality).to eq(80)

      expect(items[2].sell_in).to eq(4)
      expect(items[2].quality).to eq(50)

      expect(items[3].sell_in).to eq(4)
      expect(items[3].quality).to eq(13)

      expect(items[4].sell_in).to eq(4)
      expect(items[4].quality).to eq(8)
    end
  end
end
