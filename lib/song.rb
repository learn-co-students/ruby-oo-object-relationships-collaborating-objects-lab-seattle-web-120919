class Song
    attr_accessor :artist, :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.new_by_filename(file_name)
        artist_title_file = file_name.split(" - ")
        song = Song.new(artist_title_file[1])
        song.artist_name= artist_title_file[0]
        song
    end

    def artist_name=(artist)
        self.artist = Artist.find_or_create_by_name(artist)
        #artist.add_song(song)
    end

    def self.all 
        @@all
    end
end