require_relative '../lib/gilded_rose'

describe '#update_quality' do

  context 'with a single item' do
    let(:item) { Item.new(name, initial_sell_in, initial_quality) }

    before { update_quality([item]) }

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

    context 'for sulfuras item' do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }
      let(:initial_sell_in) { 5 }
      let(:initial_quality) { 80 }

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

    context 'for aged brie item' do
      let(:name) { 'Aged Brie' }
      let(:initial_sell_in) { 5 }
      let(:initial_quality) { 10 }

      context "before sell date" do
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality + 1)
        end

        context "with max quality" do
          let(:initial_quality) { 50 }
          it do
            expect(item.sell_in).to eq(initial_sell_in - 1)
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context "on zero sell date" do
        let(:initial_sell_in) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality + 2)
        end

        context "with max quality" do
          let(:initial_quality) { 50 }
          it do
            expect(item.sell_in).to eq(initial_sell_in - 1)
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context "after sell date" do
        let(:initial_sell_in) { -1 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality + 2)
        end

        context "with max quality" do
          let(:initial_quality) { 50 }
          it do
            expect(item.sell_in).to eq(initial_sell_in - 1)
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context 'on zero quality' do
        let(:initial_quality) { 0 }
        it do
          expect(item.sell_in).to eq(initial_sell_in - 1)
          expect(item.quality).to eq(initial_quality)
        end
      end
    end
  end

  context 'with multiple items' do
    let(:items) {
      [
          Item.new('NORMAL ITEM', 5, 10),
          Item.new('Sulfuras, Hand of Ragnaros', 5, 80),
          Item.new('Aged Brie', 5, 50)
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
    end
  end
end
