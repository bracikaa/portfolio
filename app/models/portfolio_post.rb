class PortfolioPost < ApplicationRecord
	has_many :technologies
	accepts_nested_attributes_for :technologies, 
								  reject_if: lambda { |x| x['name'].blank? }
	
	validates_presence_of :title, :body, :main_image, :thumb_image

	mount_uploader :main_image, PortfolioPostUploader
	mount_uploader :thumb_image, PortfolioPostUploader

	def self.angular
		where(subtitle: 'Angular')
	end

	def self.by_position
		order("position ASC")
	end

	scope :angular_scope, -> { where(subtitle: 'Angular') }

	after_initialize :default_values

	def default_values
		self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
		self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
	end
end
 