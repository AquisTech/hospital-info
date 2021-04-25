module FlashHelper
  def class_for(flash_type)
    { success: 'success', error: 'danger', failure: 'danger', alert: 'warning', notice: 'success' }[flash_type.to_sym]
  end

  def flash_messages
    flash.map do |msg_type, message|
      next unless class_for(msg_type)
      content_tag(:div, class: "flash-message alert alert-#{class_for(msg_type)} alert-dismissible fade show", role: 'alert') do
        (
          content_tag(:span, message) +
          button_tag(type: 'button', class: 'close', data: { dismiss: 'alert' }, aria: { label: 'Close' }) do
            content_tag(:span, '&times;'.html_safe, aria: { hidden: true })
          end
        ).html_safe
      end
    end.join.html_safe
  end
end