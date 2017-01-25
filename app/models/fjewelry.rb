class Fjewelry < ActiveRecord::Base
	scope :jewelry_type, ->(jewelry_types) { where(:jewelry_type => jewelry_types) }
	JEWELRY_TYPES = [
		"Earrings",
		"Pendants",
		"Chains",
		"Bracelets",
		"Wedding Bands",
		"Solitaire Rings"
	]

	scope :metal, ->(metals) { where(:metal => metals) }
	METALS = [
		"10K Gold",
		"14K Gold",
		"18K Gold",
		"Tungsten"
	]

	scope :color, ->(colors) { where(:color => colors) }
	COLORS = [
		"Yellow",
		"White",
		"Pink",
		"Black",
		"Blue",
		"Bronze",
		"Grey"
	]

	scope :stone, ->(stones) { where(:stone => stones) }
	STONES = [
		"Cubic Zirconia",
		"Coloured Stone",
		"Diamond",
		"No Stone"
	]

	validates :jewelry_type, presence: true, length: {maximum:50}
	validates :metal, presence: true, length: {maximum:50}
	validates :color, presence: true, length: {maximum:50}
	validates :stone, presence: true, length: {maximum:50}
	
	validates_inclusion_of :jewelry_type, in: JEWELRY_TYPES
	validates_inclusion_of :metal, in: METALS
	validates_inclusion_of :color, in: COLORS
	validates_inclusion_of :stone, in: STONES

end
