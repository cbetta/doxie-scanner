# Doxie Scanner

[![Gem Version](https://badge.fury.io/rb/doxie-scanner.svg)](https://badge.fury.io/rb/doxie-scanner)

A scanner to find your WiFi enabled [Doxie](http://getdoxie.com) scanner. It returns a list of IP addressess for all Doxie scanners discovered on your network. 

This Gem is especially useful in combination with the [Doxie client library](https://github.com/cbetta/doxie).

## Installation

Either install directly or via bundler.

```rb
gem 'doxie-scanner'
```

## Usage

The scanner uses UPnP and SSDP to search for your Doxie scanner.

```rb
require 'doxie/scanner'
Doxie::Scanner.ips
=> [
    [0] "192.168.1.2"
]
```

## Contributing

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

### Development

* `bundle install` to get dependencies
* `rake` to run all tests
* `rake console` to run a local console with the library loaded

## License

This library is released under the [MIT License](LICENSE).
