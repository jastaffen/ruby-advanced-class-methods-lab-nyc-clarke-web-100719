class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.create_by_artist_name(artist_name)
    song = Song.create
    song.artist_name = artist_name
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(str)
    new_arr = str[0..-5].split("-")
    artist_name = new_arr[0].strip
    song_name = new_arr[1].strip
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(str)
    new_arr = str[0..-5].split("-")
    artist_name = new_arr[0].strip
    song_name = new_arr[1].strip
    song = Song.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
