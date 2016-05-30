require 'doxie_scanner/version'
require 'frisky/ssdp'

class DoxieScanner
  def self.ips
    root_devices = Frisky::SSDP.search 'upnp:rootdevices'
    doxies = root_devices.select { |device| device[:location].include?('doxie')}
    hosts = doxies.map {|doxie| URI.parse(doxie[:location]).host }
    hosts.uniq
  end
end
