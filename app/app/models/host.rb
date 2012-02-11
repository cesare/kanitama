class Host < ActiveRecord::Base
  has_one :bios
  has_one :processor
  has_one :baseboard
end
