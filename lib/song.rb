require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(word)
    song = self.create
    song.name = word
    song
  end

  def self.create_by_name(word)
    song = self.create
    song.name = word
    @@all << song
    song
  end

  def self.find_by_name(word)
    @@all.detect do |song|
      song.name == word
    end
  end

  def self.find_or_create_by_name(word)
    if self.find_by_name(word) == nil
      self.create_by_name(word)
    else
      self.find_by_name(word)
    end
  end

  def self.alphabetical
    @@all.uniq.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = filename.split(" - ")
    artist = new_song[0]
    title = File.basename(new_song[-1], File.extname(new_song[-1]))
    self.new_by_artist_and_title(artist, title)
  end

  def self.create_from_filename(filename)
    new_song = filename.split(" - ")
    artist = new_song[0]
    title = File.basename(new_song[-1], File.extname(new_song[-1]))
    self.create_by_artist_and_title(artist, title)
  end

  def self.new_by_artist_and_title(artist, title)
    song = self.new
    song.artist_name = artist
    song.name = title
    song
  end

  def self.create_by_artist_and_title(artist, title)
    song = self.new
    song.artist_name = artist
    song.name = title
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end


end
