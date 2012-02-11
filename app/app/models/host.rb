class Host < ActiveRecord::Base
  has_one :bios
  has_one :processor
  has_one :baseboard
  
  validates :name, :presence => true
  validates :ipaddress,
    :format => { :with => %r{^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$}},
    :uniqueness => true
end
