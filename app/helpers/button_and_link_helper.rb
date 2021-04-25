module ButtonAndLinkHelper
  def add_new_button
    link_to '+', url_for(controller: controller_name, action: :new), class: 'btn btn-primary rounded-circle'
  end

  def link_to_edit(object)
    link_to 'Edit', url_for(action: :edit, id: object), 'btn btn-primary'
  end

  def link_to_show(object)
    link_to 'Show', object, 'btn btn-info'
  end

  def link_to_delete(object)
    link_to 'Delete', object, method: :delete, data: { confirm: "Are you sure you want to delete this #{object.class.name}?" }, class: 'btn btn-danger'
  end

  def link_to_actions(object)
    link_to_show(object) + link_to_edit(object) + link_to_delete(object)
  end
end