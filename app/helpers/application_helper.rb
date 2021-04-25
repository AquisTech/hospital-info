module ApplicationHelper
  def active_class_to(current_path)
    'active' if current_page?(current_path)
  end

  def enum_to_options(enum_hash, selected_val)
    options_for_select(enum_hash.map{ |key, value| [key.upcase_first, key] }, selected_val)
  end

  def text_with_badge(text, badge)
    "#{text} <span class='badge badge-pill badge-primary'>#{badge}</span>".html_safe
  end
end
