require 'wiki/extensions'

module Wiki
  class WikiError < StandardError; end

  class MessageError < WikiError; end

  module Utils
    def self.included(base)
      # Also as class methods
      base.extend self
    end

    def forbid(conds)
      failed = conds.keys.select {|key| conds[key]}
      raise MessageError.new(failed) if !failed.empty?
    end

    def safe_require(name)
      require(name)
      true
    rescue
      false
    end
  end
end