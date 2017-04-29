class LocalLibrary::Library
  attr_accessor :status, :address, :phone
  attr_reader :branch

  @@libraries = []

  def initialize(branch)
    @branch = branch
  end

  def self.libraries
    @@libraries
  end

  def self.clear
    self.libraries.clear
  end
end
