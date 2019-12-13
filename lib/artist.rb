require 'pry'

class Artist
    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def songs
        Song.all.find_all do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        # binding.pry
        # if @@all.include?(name)
        #     puts "found #{name}"
        #     @@all.find do |artist|
        #         artist.name == name
        #     end
        # else
        #     Artist.new(name)
        #     @@all.find do |artist|
        #         puts "created & found #{name} #{@@all}"
        #         artist.name == name
        #     end
        # end
        ObjectSpace.each_object(Artist).find do |artist|
            if name == artist.name
                artist
            else 
               Artist.new(name)
            end
        end
    end

    def print_songs
        songs.map do |song|
           puts song.name
        end
    end
end