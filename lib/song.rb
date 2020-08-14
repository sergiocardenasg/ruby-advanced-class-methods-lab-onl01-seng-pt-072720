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
    song = self.new
    song.save
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
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name
  end

  def self.alphabetical
      self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist_name = info[0]
    song_info = info[1].split(".mp3")
    name = song_info[0]

    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename
  end

  def self.destroy_all
    self.all.clear
  end

end
