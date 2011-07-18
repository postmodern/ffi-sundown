# ffi-sundown

* [Source](http://github.com/postmodern/ffi-sundown)
* [Issues](http://github.com/postmodern/ffi-sundown/issues)
* [Documentation](http://rubydoc.info/gems/ffi-sundown/frames)
* [Email](mailto:postmodern.mod3 at gmail.com)

## Description

Ruby FFI bindings for the libsundown markdown library.

## Examples

    require 'ffi/sundown'

    doc = FFI::Sundown::Document.new(File.read('README.md'))
    puts doc.to_html
    # <h1>ffi-sundown</h1>
    #
    # <ul>
    # <li><a href="http://github.com/postmodern/ffi-sundown">Source</a></li>
    # <li><a href="http://github.com/postmodern/ffi-sundown/issues">Issues</a></li>
    # <li><a href="http://rubydoc.info/gems/ffi-sundown/frames">Documentation</a></li>
    # <li><a href="mailto:postmodern.mod3 at gmail.com">Email</a></li>
    # </ul>
    #
    # <h2>Description</h2>
    #
    # <p>Ruby FFI bindings for the libsundown markdown library.</p>
    #
    # <h2>Examples</h2>
    #
    # <pre><code>require 'ffi/sundown'
    #
    # doc = FFI::Sundown::Document.new(File.read('README.md'))
    # puts doc.to_html
    # </code></pre>
    #
    # <h2>Requirements</h2>
    # 
    # <ul>
    # <li><a href="https://github.com/tanoku/sundown">libsundown</a> &gt;= 1.2.0</li>
    # </ul>
    #
    # <h2>Install</h2>
    #
    # <pre><code>$ gem install ffi-sundown
    # </code></pre>
    #
    # <h2>Copyright</h2>
    #
    # <p>Copyright (c) 2011 Hal Brodigan</p>
    #
    # <p>See {file:LICENSE.txt} for details.</p>
    
    puts doc.to_toc
    # <ul>
    # <li><a href="#toc_0">ffi-sundown</a></li>
    # <li><ul>
    # <li><a href="#toc_1">Description</a></li>
    # <li><a href="#toc_2">Examples</a></li>
    # <li><a href="#toc_3">Requirements</a></li>
    # <li><a href="#toc_4">Install</a></li>
    # <li><a href="#toc_5">Copyright</a></li>
    # </ul></li>
    # </ul>

## Requirements

* [libsundown](https://github.com/tanoku/sundown) >= 1.2.0
* [ffi](http://github.com/ffi/ffi) ~> 1.0

## Install

    $ gem install ffi-sundown

## Copyright

Copyright (c) 2011 Hal Brodigan

See {file:LICENSE.txt} for details.
