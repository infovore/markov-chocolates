#!/usr/bin/env ruby

require 'lib/array.rb'
require 'lib/markov_chain.rb'

# Courtesy of http://rubyquiz.com/quiz74.html
mc = MarkovChain.new(File.read("chocolate.txt"))

# create_or_update method taken from http://railspikes.com/2008/2/1/loading-seed-data
output = []
1.upto(100) do
  output << mc.sentences(1).capitalize
end

output.each {|l| puts l}


