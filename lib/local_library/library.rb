class LocalLibrary::Library
  attr_accessor :status, :address, :phone
  attr_reader :branch

  @@libraries = []

  def initialize(branch)
    @branch = branch
    @@libraries << self
  end

  def self.libraries
    @@libraries
  end

  def self.clear
    self.libraries.clear
  end

  def self.open_libraries
    self.libraries.select do |library|
      library.status == "Open"
    end
  end
end
