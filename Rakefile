require 'rubygems'
require 'rake/gempackagetask'
require 'zlib'

PACKAGE_VERSION = File.open('CHANGES'){ |io| 
  io.read[/\b\d+\.\d+\.\d+\b/] 
}

spec = Gem::Specification.new do |s|
  s.name   = "cobravsmongoose"
  s.version = PACKAGE_VERSION
  s.author = "Paul Battley"
  s.email = "pbattley@gmail.com"
  s.summary = "Translates XML to and from Ruby Hash objects, "+
              "following the BadgerFish convention."
  s.files = Dir['{lib,test}/**/*.rb']
  s.require_path = "lib"
  s.test_file = 'test/all.rb'
  s.has_rdoc = true
  s.extra_rdoc_files = %w[README CHANGES COPYING]
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar_gz = true
end

task :default => %W[
  pkg/#{spec.name}-#{spec.version}.gem
  pkg/#{spec.name}-#{spec.version}.tar.gz
] do
  puts "packaged version #{spec.version}"
end