class Admgemstone < ActiveRecord::Base
	self.table_name = "gemstones"
	SHAPES = [
		"ROUND",
		"OVAL",
		"SQUARE",
		"MARQUIS",
		"PEAR",
		"STRAIGHT_BAGUETTE",
		"TAPERED_BAGUETTE",
		"EMERALD_OCTAGON",
		"RECTANGLE",
		"CUSHION",
		"HEART",
		"TRIANGLE",
		"TRILLIUM"
	]

	GEM_TYPES = [
		"GENUINE",
		"SYNTHETIC"
	]

	validates :shape, presence: true, length: {maximum:50}
	validates :size, presence: true, length: {maximum:50}
	validates :description, presence: true, length: {maximum:50}
	validates :colortone, presence: true, length: {maximum:50}
	validates :gemtype, presence: true, length: {maximum:50}
	validates :brand, length: {maximum:50}
	validates :price, presence: true, length: {maximum:50}
	validates_inclusion_of :gemtype, in: GEM_TYPES
	validates_inclusion_of :shape, in: SHAPES
end
