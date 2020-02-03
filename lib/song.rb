require "pry"
# require_relative "artist"
# require_relative "mp3_importer"

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  # def artist_name
  # end

  def self.new_by_filename(filename)
    binding.pry
  end
end
