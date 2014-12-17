# encoding: UTF-8

require 'rubygems'
require 'rdoc/task'
require 'rake/testtask'
require 'rubygems/package_task'

spec = Gem::Specification.new do |s|
  s.name       = "nfqueue"
  s.version    = "1.0.3"
  s.author     = "Guillaume Delugré"
  s.email      = "guillaume AT security-labs DOT org"
  s.homepage   = "http://code.google.com/p/ruby-nfqueue"
  s.platform   = Gem::Platform::RUBY
  s.licenses   = [ "GPL" ]
  
  s.summary    = "nfqueue is a simple wrapper around libnetfilter_queue using FFI."
  s.description = <<DESC
nfqueue is a tiny wrapper around libnetfilter_queue. It allows you to very simply intercept and modify network traffic in a Ruby environment.
DESC

  s.files             = FileList[
    'README', 'COPYING', "{lib}/**/*", "{samples}/**/*"
  ]

  s.require_path      = "lib"
  s.has_rdoc          = true
  s.requirements      = "Support for NFQUEUE in your Linux kernel, libnetfilter_queue installed and Ruby FFI"

  s.add_dependency('ffi', '>= 0')
  s.add_dependency('nfnetlink', '>=0')
end

task :default => [:package]

Gem::PackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

