require 'frisky/ssdp'

module Doxie
  class Scanner
    def self.ips(frisky = Frisky::SSDP)
      root_devices = frisky.search 'upnp:rootdevices'
      doxies = root_devices.select { |device| device[:location].include?('doxie')}
      hosts = doxies.map {|doxie| URI.parse(doxie[:location]).host }
      hosts.uniq
    end
  end
end
