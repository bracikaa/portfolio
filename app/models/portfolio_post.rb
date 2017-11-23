class PortfolioPost < ApplicationRecord
	
	has_many :technologies, dependent: :destroy	

	accepts_nested_attributes_for :technologies, 
								allow_destroy: true,
								reject_if: lambda { |x| x['name'].blank? }
	
	validates_presence_of :title, :body

	mount_uploader :main_image, PortfolioPostUploader
	mount_uploader :thumb_image, PortfolioPostUploader

	def self.angular
		where(subtitle: 'Angular')
	end

	def self.by_position
		order("position ASC")
	end

	scope :angular_scope, -> { where(subtitle: 'Angular') }
end
