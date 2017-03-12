class Finding < ActiveRecord::Base
	has_attached_file :finding_img, styles: { finding_index: "300x300>", finding_show: "500x500>" }, default_url: "/images/:style/missing.png"
	 	
  	validates_attachment_content_type :finding_img, content_type: /\Aimage\/.*\z/


	scope :finding_type, ->(finding_types) { where(:finding_type => finding_types) }
	FINDING_TYPES = [
		"Earrings & Earring Parts",
		"Pendants & Bails",
		"Clasps",
		"Solders",
		"Wires",
		"Alloys",
		"Miscellaneous"
	]

	scope :metal, ->(metals) { where(:metal => metals) }
	METALS = [
		"10K Gold",
		"14K Gold",
		"18K Gold",
		"Silver",
		"Non-Precious"
	]

	scope :color, ->(colors) { where(:color => colors) }
	COLORS = [
		"Yellow",
		"White",
		"Pink",
		"2 Tone"
	]

	validates :finding_type, presence: true, length: {maximum:50}
	validates :metal, presence: true, length: {maximum:50}
	validates :color, presence: true, length: {maximum:50}

	
	validates_inclusion_of :finding_type, in: FINDING_TYPES
	validates_inclusion_of :metal, in: METALS
	validates_inclusion_of :color, in: COLORS
end
