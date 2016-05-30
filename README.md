# Doxie Scanner

[![Gem Version](https://badge.fury.io/rb/doxie-scanner.svg)](https://badge.fury.io/rb/doxie-scanner)

A scanner to find your the [Doxie Go Wifi](http://getdoxie.com). Returns an IP or list of IPs for your Doxie scanner. Very useful in combination with the [Doxie API gem](https://github.com/cbetta/doxie).

## Installation

Either install directly or via bundler.

```rb
gem 'doxie-scanner'
```

## Usage

The scanner uses UPnP and SSDP to search for your Doxie.

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
* `rake` to run tests
* `rake console` to run a local console with the library loaded

## License

This library is released under the [MIT License](LICENSE).
