class Song
    attr_reader :name, :artist, :duration
  
    def initialize(name, artist, duration)
      @name = name
      @artist = artist
      @duration = duration
    end
  
    def play
      puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
    end
end

class Playlist
    def initialize(name)
      @name = name
      @songs = []
    end
  
    def add_song(song)
      @songs << song
    end

    def each 
        @songs.each {|song| yield song}
    end

    def play_songs
        puts "\nPlaying collection:"
        each {|song| song.play}
    end
end

song1 = Song.new("One", "Band One", 10)
song2 = Song.new("Two", "Band Two", 11)
song3 = Song.new("Three", "Band Three", 15)

playlist = Playlist.new("My Playlist")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

playlist.each { |song| song.play }

playlist.play_songs
