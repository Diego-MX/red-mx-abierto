module SignUpHelper
  def show_government_fields_class(government_types, selected)
    unless government_types.include? selected
      'hide'
    end
  end
end
