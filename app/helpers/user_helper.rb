module UserHelper
  def pretty_government(government_type)
    government_type.capitalize
  end

  def pretty_location(resource)
    final_text = []
    final_text.push(resource.state) if resource.state.present?
    final_text.push(resource.municipality) if resource.municipality.present?
    final_text.push(resource.deputation) if resource.deputation.present?
    final_text.join(' / ')
  end
end
