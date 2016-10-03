require "prev/next/version"

module Prev
  module Next
    def self.index(recordset)
      prevnext = Hash.new
      previous = nil
      current = nil
      recordset.each do |record|
        prevnext[record.id] = Hash.new
        prevnext[current.id][:next] = record if current
        prevnext[current.id][:prev] = previous if previous
        previous = current
        current = record
      end
      prevnext[current.id][:prev] = previous if previous
      return prevnext
    end
  end
end
