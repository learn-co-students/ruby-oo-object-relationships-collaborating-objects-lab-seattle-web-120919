class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        # binding.pry
        @files = Dir.entries(path).grep(/.*\.mp3/)
    end

    def import
        # binding.pry
        files.each do |file|
            Song.new_by_filename(file)
        end
    end
end