class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name
    artist&.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def notes_1=(content)
    notes << Note.create(content: content)
  end
  
  def notes_2=(content)
    notes << Note.create(content: content)
  end

  def notes_1
    notes&.first&.content
  end

  def notes_2
    notes&.second&.content
  end

  def note_contents
    notes.map(&:content)
  end

  def note_contents=(contents)
    self.notes = contents.map { |note| Note.new(content: note) }
  end
end
