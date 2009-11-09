# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def locations_name(l)
    if not l.location_type_id.blank?
      l.location_type.name
    else
      l.location_variation.name
    end
  end
end
