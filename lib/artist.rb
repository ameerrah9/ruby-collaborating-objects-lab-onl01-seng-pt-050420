class Artist
    attr_accessor :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def add_song(song)
      song.artist = self
    end
  
    def add_song_by_name(name)
      song = Song.new(name)
      song.artist = self
    end
  
    def songs
      Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)

        found_artist = self.all.find {|artist| artist.name == name}
        if found_artist
            found_artist
        else
            created_artist = self.new(name)
            created_artist
        end
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end
