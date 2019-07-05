require "pry"

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
    @@all << song
    return song
    end
 
 
    def self.new_by_name(name)
    song = self.new
    song.name = name
    song
 end
 
     def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    
  end
  
  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
    end
    
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end
  
  def self.alphabetical
  @@all.sort_by {|name| name.name}
end

def self.new_from_filename(file_name)
  song_name_mp3 = file_name.split("-")[1]
  song_name = song_name_mp3[1..-5]
 artist = file_name.split("-")[0].strip
 song = self.new_by_name(song_name)
 song.artist_name = artist
 song
end

def self.create_from_filename(file_name)
  song = self.new_from_filename(file_name)
  song.save
end

end

