require 'pry'
class Genre
    attr_reader :name 

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def songs 
        Song.all.select {|song| song.genre == self}
    end

    def self.all 
        @@all
    end

    def artists
        #binding.pry 
        self.songs.collect {|song_instance| song_instance.artist}

    end

end


