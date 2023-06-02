if @house.persisted?
  json.form render(partial: "houses/form", formats: :html, locals: {house: House.new})
  json.inserted_item render(partial: "houses/house", formats: :html, locals: {house: @house})
else
  json.form render(partial: "houses/form", formats: :html, locals: {house: @house})
end
