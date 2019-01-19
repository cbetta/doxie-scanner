require 'frisky/ssdp'

module Doxie
  class Scanner
    def self.ips(frisky = Frisky::SSDP)
      root_devices = frisky.search 'upnp:rootdevices'
      doxies = root_devices.select { |device| device[:location].include?('doxie')}
      hosts = doxies.map {|doxie| URI.parse(doxie[:location]).host }
      hosts.uniq
    end

    def self.devices(frisky = Frisky::SSDP)
      root_devices = frisky.search 'upnp:rootdevices'
      doxies = root_devices.select { |device| device[:location].include?('doxie')}
      hosts = doxies.map do |doxie| 
        {
          ip: URI.parse(doxie[:location]).host,
          model: Doxie::Scanner.api_version(doxie[:server])
        }
      end
      hosts.uniq
    end

    private

    def self.api_version server
      server.include?('DX250') ? "API_V1" : "API_V2"
    end
  end
end
