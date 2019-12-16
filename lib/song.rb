require 'pry'

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

    # filename: "Michael Jackson - Black or White - pop.mp3"
    # creates a new instance of a song from the file that's passed
    # associate new song to artist, using artist attribute accessor to assign this
    def self.new_by_filename(filename)
        song = self.new(filename)
        song.name = filename.split(" - ")[1]
        # song.Artist = filename.split(" - ")[0]
        song
        # binding.pry
    end

    #finds|creates an Artist instance and assigns it to the Song's artist attribute
    def artist_name=(name)
        if (self.artist.nil?)
            self.artist = Artist.new(name)
        else
            self.artist.name = name
        end
    end 
end
