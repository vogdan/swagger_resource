# encoding: utf-8
require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'rdoc' # https://github.com/lsegal/yard/commit/b861dcc2d7f7e1fbbed7b552ac2e4f7caf68bafa
require 'rake/clean'
require 'pathname'
Bundler::GemHelper.install_tasks

$:.unshift(File.dirname(__FILE__) + '/lib')

task :default => :test

task :test => [:spec] #, :cucumber]
