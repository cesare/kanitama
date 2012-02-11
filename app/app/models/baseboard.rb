class Baseboard < ActiveRecord::Base
  belongs_to :host
  has_many :memories
end
