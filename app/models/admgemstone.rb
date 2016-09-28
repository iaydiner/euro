class Admgemstone < ActiveRecord::Base
	self.table_name = "gemstones"
	scope :shape, ->(shapes) { where(:shape => shapes) }
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

	scope :gemtype, ->(gemtypes) { where(:gemtype => gemtypes) }
	GEMTYPES = [
		"GENUINE",
		"SYNTHETIC"
	]

	scope :stone, ->(stones) { where(:stone => stones) }
	STONES = [
		"Alexandrite",
		"Amber",
		"Amethyst",
		"Ammolite",
		"Andalusite",
		"Aquamarine",
		"Black Pearl",
		"Bloodstone",
		"Blue Sapphire",
		"Blue Topaz",
		"Blue Zircon",
		"Cameo",
		"Carnelian",
		"Catsite",
		"Citrine",
		"Coral",
		"Cubic Zirconia",
		"Emerald",
		"Garnet",
		"Green Tourmalin",
		"Hematite",
		"Iolite",
		"Jade",
		"Lapis",
		"Malachite",
		"Marcasite",
		"Masonic",
		"Mexican Opal",
		"Moonstone",
		"Mother of Pearl",
		"Mystic Topaz",
		"Onyx",
		"Opal",
		"Opal Triplet",
		"Pearl",
		"Peridot",
		"Pink Cubic",
		"Pink Sapphire",
		"Pink Tourmaline",
		"Rhodolite",
		"Rose",
		"Ruby",
		"Smoky Quartz",
		"Smoky Topaz",
		"South Sea Pearl",
		"Star Sapphire",
		"Tahitian Pearl",
		"Tanzanite",
		"Tigereye",
		"Tsavorite",
		"Turquoise",
		"White Sapphire",
		"Yellow Sapphire",
		"Yellow Topaz"
	]

	COLORTONES = [
		"Black",
		"Blue",
		"Brown",
		"Green",
		"Grey",
		"London Blue",
		"Orange",
		"Pink",
		"Purple",
		"Red",
		"Teal",
		"Sky Blue",
		"Swiss Blue",
		"White",
		"Yellow",
		"Multicolor"
	]

	BRANDS = [
		"Swarovski",
		""
	]

	validates :shape, presence: true, length: {maximum:50}
	validates :size, presence: true, length: {maximum:50}
	validates :stone, presence: true, length: {maximum:50}
	validates :colortone, presence: true, length: {maximum:50}
	validates :gemtype, presence: true, length: {maximum:50}
	validates :brand, length: {maximum:50}
	validates :price, presence: true, length: {maximum:50}
	validates_inclusion_of :brand, in: BRANDS
	validates_inclusion_of :colortone, in: COLORTONES
	validates_inclusion_of :stone, in: STONES
	validates_inclusion_of :gemtype, in: GEMTYPES
	validates_inclusion_of :shape, in: SHAPES
end
