require 'minitest/autorun'
require 'doxie/scanner'

describe 'Doxie::Scanner' do
  before do 
    @frisky = Minitest::Mock.new
    @args = ['upnp:rootdevices']
    @return_value = []
  end

  describe '.ips' do
    it 'should search for upnp:rootdevices' do
      @frisky.expect :search, @return_value, @args
      ips = Doxie::Scanner.ips(@frisky)
      @frisky.verify
      assert_equal ips, @return_value
    end
    
    it 'should extract the host names for doxie devices' do
      @frisky.expect :search, [
        { location: "http://127.0.0.1/doxie/foo" },
        { location: "http://127.0.0.2/doksy/foo" },
      ], @args
      ips = Doxie::Scanner.ips(@frisky)
      assert_equal ips, ['127.0.0.1']
    end
  
    it 'should only find unique host names' do
      @frisky.expect :search, [
        { location: "http://127.0.0.1/doxie/foo" },
        { location: "http://127.0.0.1/doxie/foo" },
      ], @args
      ips = Doxie::Scanner.ips(@frisky)
      assert_equal ips.length, 1
    end
  end

  describe '.devices' do
    it 'should search for upnp:rootdevices' do
      @frisky.expect :search, @return_value, @args
      devices = Doxie::Scanner.devices(@frisky)
      @frisky.verify
      assert_equal devices, @return_value
    end
    
    it 'should extract the host names and api version number for doxie devices' do
      @frisky.expect :search, [
        { location: "http://127.0.0.1/doxie/foo", server: 'Linux/2.6.30.9, UPnP/1.0, DoxieDX300/1.08' },
        { location: "http://127.0.0.2/doxie/foo", server: 'Linux/2.6.30.9, UPnP/1.0, DoxieDX250/1.08' },
        { location: "http://127.0.0.3/noxie/foo", server: 'Linux/2.6.30.9, UPnP/1.0, Noxie/1.08' },
      ], @args
      devices = Doxie::Scanner.devices(@frisky)
      assert_equal devices, [
        { ip: '127.0.0.1', model: 'API_V2' },
        { ip: '127.0.0.2', model: 'API_V1' },
      ]
    end
  
    it 'should only find unique host names' do
      @frisky.expect :search, [
        { location: "http://127.0.0.1/doxie/foo", server: 'Linux/2.6.30.9, UPnP/1.0, DoxieDX300/1.08' },
        { location: "http://127.0.0.1/doxie/foo", server: 'Linux/2.6.30.9, UPnP/1.0, DoxieDX300/1.08' },
      ], @args
      devices = Doxie::Scanner.devices(@frisky)
      assert_equal devices.length, 1
    end
  end
end