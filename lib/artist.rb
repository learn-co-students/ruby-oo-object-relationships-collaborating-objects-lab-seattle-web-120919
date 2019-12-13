class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def add_song(song)
        Song.new(song)
        song.artist = self
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end

    def save
        @@all << self
        self
    end

    def self.find_or_create_by_name(name)
        #self.all.detect {|artist| artist.name == name} || Artist.new(name).save

        # ObjectSpace.each_object(self) do |artist|
        #     if artist.name == name
        #         return artist
        #     else
        #         Artist.new(name)
        #     end
        # end

        if @@all.find{|artist| artist.name == name}
            @@all.find{|artist| artist.name == name}
        else
            Artist.new(name)
        end

        # @@all.each do |artist|
        #     if artist.name == name
        #         return artist
        #     end
        # end
        # Artist.new(name)
    end

    def self.all
        @@all
    end

    def songs
        Song.all.find_all{|song| song.artist == self}
    end
end