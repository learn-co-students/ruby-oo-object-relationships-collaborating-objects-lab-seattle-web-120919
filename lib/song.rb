require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = []

    #create songs with filenames (from mp3), send artist name to Artist class
    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all 
    end

    # filename: "Michael Jackson - Black or White - pop.mp3"
    # creates a new instance of a song from the file that's passed
    # associate new song to artist, using artist attribute accessor to assign this
    def self.new_by_filename(filename)
        parts = filename.split(" - ")
        artist = parts[0]
        song = parts[1].gsub(".mp3", "")

        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
        # binding.pry
    end

    #finds|creates an Artist instance and assigns it to the Song's artist attribute
    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
    end
end
