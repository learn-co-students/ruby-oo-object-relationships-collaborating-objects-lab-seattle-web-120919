class Song
    attr_accessor :name, :artist, :genre

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

    def artist_name=(name)
        # binding.pry
        if (self.artist.nil?)
          self.artist = Artist.new(name)
        else
          self.artist.name = name
        end
    end

    def self.new_by_filename(file_name)
        # binding.pry
        artistobj = nil
        fileinfo = file_name.split(" - ")
        # ObjectSpace.each_object(Artist).find do |artist|
        #     if fileinfo[0] == artist.name
        #         artistobj = artist
        #     end
        # end

       
        song = Song.new(fileinfo[1])

        song.artist_name = fileinfo[0]

        song

        # songobj.artist = artistobj
    end

end