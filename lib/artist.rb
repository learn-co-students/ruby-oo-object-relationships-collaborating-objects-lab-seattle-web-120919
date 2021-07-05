require "pry"
# require_relative "song"
# require_relative "mp3_importer"
# require_relative './models/file_name'

# HAS_MANY_THROUGH*
# BELONGS_TO
# CHAINING HELPER METHODS WITH ARGUMENTS

class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select { |song| self == song.artist }
  end

  def add_song(song)
    song.artist = self
  end

  # return an istance of the artist from helper methods: find/create
  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end

  # Find the artist instance that has that name
  def self.find(name)
    self.all.find do |artist|
      artist.name == name
    end
  end

  # create one if it doesn't exist
  def self.create(name)
    name = self.new(name)
    @@all << name
    name
  end

  def print_songs
    songs.select { |song| puts song.name }
  end
end
