require 'minitest/autorun'
require 'doxie/scanner'

describe 'Doxie::Scanner' do
  before do 
    @frisky = Minitest::Mock.new
    @return_value = []
    @args = ['upnp:rootdevices']
  end

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