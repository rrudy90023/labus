class Rider < ActiveRecord::Base

	belongs_to :user


  	validates :bus, presence: true, numericality: true
  	validates :busline, presence: true, numericality: true
  	validates :story, presence: true

end
