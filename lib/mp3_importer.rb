class MP3Importer
    attr_accessor :path 
    
    #accepts a file path to parse mp3 files from
    def initialize(path)
        @path = path
    end

    # loads all the mp3 files in the path directory
    # normalizes the filename to ".mp3" filename with no path
    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    # imports the files into the library by creating songs from a filename
    # Since we have to send the filenames to the Song class, we'll end up calling 
    # the following code in the #import method: Song.new_by_filename(some_filename). 
    # This will send us to the Song class, specifically Song.new_by_filename and 
    # handle the creation of Song instances and their associated Artist instances.
    def import
        files.each{|f| Song.new_by_filename(f)}
    end
end
