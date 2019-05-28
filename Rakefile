# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/extensiontask'
require 'rake/testtask'

Rake::ExtensionTask.new('cogito') do |ext|
  ext.lib_dir = File.join('lib', 'cogito')
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

Rake::Task[:test].prerequisites << :compile

task default: :test
