module EventsHelper
  def header_background_image_url
    image_path('color-me-run.jpg')
  end

   def get_hash_venue
    Hash[Venue.all.collect { |venue| [venue.name, venue.id]}]
  end

  def get_hash_category
    Hash[Category.all.collect { |category| [category.name, category.id]}]
  end
end
