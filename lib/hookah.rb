require "hookah/version"
require 'hookah/builder'
require 'hookah/daniel_is_awesome'

module Hookah
  def self.enhance(other, &block)
    other.module_eval do
      include ::Hookah::DanielIsAwesome
    end
    builder = Builder.new(other)
    builder.instance_exec(&block)
  end
end
