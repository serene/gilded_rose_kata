# frozen_string_literal: true
require 'rspec'
require_relative './gilded_rose'

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      item = Item.new("foo", 0, 0)
      GildedRose.new([item]).update_quality
      expect(item.name).to eq "foo"
    end
  end
end
