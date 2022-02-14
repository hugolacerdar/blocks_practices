require_relative "my_enumerable"

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

  def each_filename
    extensions = [".mp3", ".wav", ".aac"]
    filename = "#{@name}-#{@artist}".downcase.gsub(" ", "-")
    extensions.each { |ext| yield filename + ext }
  end
end

class Playlist
  # include Enumerable
  include MyEnumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each { |song| yield song }
  end

  def each_tagline
    @songs.each { |song| yield "#{song.name} - #{song.artist}" }
  end

  def each_by_artist(artist)
    @songs.each { |song| yield song if song.artist == artist }
  end

  def play_songs
    puts "\nPlaying collection:"
    each { |song| song.play }
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

one_songs = playlist.my_select { |song| song.name =~ /One/ }
p one_songs

non_one_songs = playlist.my_reject { |song| song.name =~ /One/ }
p non_one_songs

p playlist.my_any? { |song| song.artist == "Band Twos" }
p playlist.my_detect { |song| song.artist == "Band One" }

song_labels = playlist.my_map { |song| "#{song.name} - #{song.artist}" }
p song_labels

total_duration = playlist.my_reduce(0) { |sum, song| sum + song.duration }
p total_duration

playlist.each_tagline { |tagline| puts tagline }

playlist.each_by_artist("Band One") { |song| song.play }

song1.each_filename { |filename| puts filename }
