# frozen_string_literal: true
require 'rspec'
require_relative './gilded_rose'

describe GildedRose do
  describe "#update_quality" do
    subject { GildedRose.new([item]).update_quality }

    context 'when is "Backstage passes to a TAFKAL80ETC concert"' do
      let(:name) { "Backstage passes to a TAFKAL80ETC concert" }

      context 'when sell in is 11' do
        let(:item) { Item.new(name, 11, 10) }

        it 'decreases sell in and increases quality' do
          subject

          expect(item.sell_in).to eq 10
          expect(item.quality).to eq 11
        end
      end

      context 'when sell in is 10' do
        let(:item) { Item.new(name, 10, 10) }

        it 'decreases sell in and increases quality by 2' do
          subject

          expect(item.sell_in).to eq 9
          expect(item.quality).to eq 12
        end
      end

      context 'when sell in is 5' do
        let(:item) { Item.new(name, 5, 10) }

        it 'decreases sell in and increases quality by 3' do
          subject

          expect(item.sell_in).to eq 4
          expect(item.quality).to eq 13
        end
      end
    end

    describe 'edge cases for special items' do
      let(:item) { Item.new(name, 10, 10) }

      context 'when is "Aged Brie"' do
        let(:name) { "Aged Brie" }

        it 'decreases sell in and increases quality' do
          subject

          expect(item.sell_in).to eq 9
          expect(item.quality).to eq 11
        end
      end


      context 'when is "Sulfuras, Hand of Ragnaros"' do
        let(:name) { "Sulfuras, Hand of Ragnaros" }

        it 'does not change sell in or quality' do
          subject

          expect(item.sell_in).to eq 10
          expect(item.quality).to eq 10
        end
      end

      context 'when is some other item' do
        let(:name) { "Orchids" }

        it 'decreases sell in and quality' do
          subject

          expect(item.sell_in).to eq 9
          expect(item.quality).to eq 9
        end
      end
    end
  end
end
