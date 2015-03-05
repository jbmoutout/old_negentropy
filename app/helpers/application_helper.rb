module ApplicationHelper

def get_related_url(dialog_id)
    dialog = Dialog.find(dialog_id)
    artist = dialog.artwork.artist
    related_artists = []
    related_artworks = []
    artworks_links = []

    if artist.galleries.any?
      galleries = artist.galleries
       galleries.each do |gallery|
         related_artists += gallery.artists.joins(:galleries).distinct
       end

       related_artists.uniq!
     end

    related_artists.each do |artist|
      related_artworks += artist.artworks
    end

    related_artworks.each do |artwork|
      if artwork.dialogs[0]
         artworks_links += artwork.dialogs
      end
    end

     return artworks_links

  end

end
