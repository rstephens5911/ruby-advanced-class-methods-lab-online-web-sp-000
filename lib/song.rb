class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # class constructors

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |alphabet| alphabet.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ") [1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ") [0])
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ") [1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ") [0])
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
