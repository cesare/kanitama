class Host < ActiveRecord::Base
  has_one :bios
  has_one :processor
end
