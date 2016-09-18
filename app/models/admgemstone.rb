class Admgemstone < ActiveRecord::Base
	self.table_name = "gemstones"
	validates :shape, presence: true, length: {maximum:50}
	validates :size, presence: true, length: {maximum:50}
	validates :description, presence: true, length: {maximum:50}
	validates :colortone, presence: true, length: {maximum:50}
	validates :gemtype, presence: true, length: {maximum:50}
	validates :brand, length: {maximum:50}
	validates :price, presence: true, length: {maximum:50}
	validates_inclusion_of :gemtype, in: ["Genuine", "Synthetic"]
	validates_inclusion_of :shape, in: ["Round", "Oval", "Square","Marquis","Pear","Straight Baguette","Tapered Baguette","Emerald Octagon","Rectangle","Cushion","Heart","Triangle","Trillium"]
end