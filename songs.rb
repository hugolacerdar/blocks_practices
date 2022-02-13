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
    include Enumerable

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

one_songs = playlist.select { |song| song.name =~ /One/ }
p one_songs

non_one_songs = playlist.reject { |song| song.name =~ /One/ }
p non_one_songs

p playlist.any? { |song| song.artist == "Band Two" }
p playlist.detect { |song| song.artist == "Band Two" }

song_labels = playlist.map { |song| "#{song.name} - #{song.artist}" }
p song_labels

total_duration = playlist.reduce(0) { |sum, song| sum + song.duration }
p total_duration