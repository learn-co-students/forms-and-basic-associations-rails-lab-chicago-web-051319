class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents=(note_contents)
    note_contents.each do |note|
        if note == ""
          next
        else
          this_note = Note.find_or_create_by(content: note)
          self.notes << this_note
        end
    end
  end

  def note_contents
    if self.notes
      self.notes.map do |note|
        note.content
      end
    else
      nil
    end
  end

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
end
