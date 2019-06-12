class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre

  # check later
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(note_contents)
    note_contents.each do |note_content|
      if note_content.length > 0
      new_note = Note.find_or_create_by(content: note_content)
      self.notes << new_note
      else
        nil
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end
