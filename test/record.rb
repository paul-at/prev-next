# Dummy class that implements ActiveRecord-compatible id interface
class Record
  attr_reader :id

  def initialize(id)
    @id = id
  end
end