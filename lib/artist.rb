class Artist
    attr_accessor :name, :songs
    @@all = []

    # find or create artist with name from Song class.
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # tell a passed in Song instance it belongs to this Artist instance.
    # self refers to an instance of Artist aka the artist's name
    def add_song(song)
        song.artist = self 
    end 

    # return an Array of all songs that belong to this Artist instance.
    # get all existing Song instances from Song and select only the ones that are 
    # associated with this Artist instance.
    def songs
        Song.all.select {|song| song.artist == self }
    end 

    # Find the artist instance that has the passed in name or create one if it doesn't
    # exist. Return an instance of an artist with the name attribute filled out.
    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end 

    def self.find(name)
        self.all.find {|artist| artist.name == name } 
    end

    # outputs the names of all songs associated with this Artist instance.
    def print_songs
        songs.each do |song|
            puts "#{song.name}"
        end
    end 
end
