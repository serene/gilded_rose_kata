# frozen_string_literal: true
require 'rspec'
require_relative './gilded_rose'

describe GildedRose do
  describe "#update_quality" do
    subject { GildedRose.new([item]).update_quality }

    let(:item) { Item.new(name, 10, 10) }

    context 'when is "Aged Brie"' do
      let(:name) { "Aged Brie" }

      it 'decreases sell in and increases quality' do
        subject

        expect(item.sell_in).to eq 9
        expect(item.quality).to eq 11
      end
    end

    context 'when is "Backstage passes to a TAFKAL80ETC concert"' do
      let(:name) { "Backstage passes to a TAFKAL80ETC concert" }

      it 'decreases sell in and increases quality' do
        subject

        expect(item.sell_in).to eq 9
        expect(item.quality).to eq 12
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

      it 'decreases sell in and qualit' do
        subject

        expect(item.sell_in).to eq 9
        expect(item.quality).to eq 9
      end
    end
  end
end
