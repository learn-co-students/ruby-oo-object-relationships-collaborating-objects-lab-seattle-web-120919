require "pry"
# require_relative "artist"
# require_relative "song"

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  # You should write code that responds to
  # `MP3Importer.new('./spec/fixtures').import`.
  # Google around for how to get a list
  # of files in a directory! Make sure you only
  # get `.mp3` files.
  def files
    files = Dir.glob("#{@path}/*.mp3")
    normalized = files.map do |file|
      file.split("#{@path}/")
    end
    normalized.map do |file|
      file.reject { |song| song.empty? }
    end.flatten
  end

  def self.all
    @@all
  end
  # send files names to the Songs class.
  # we need to use files, seperate the files,
  # and send them to the Songs class
  def import
  end
end
