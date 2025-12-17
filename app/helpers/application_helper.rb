module ApplicationHelper
  def icon(name, color: nil, size: nil, **options)
    classes = []
    classes << "icon-#{color}" if color
    classes << "icon-#{size}" if size
    classes << options.delete(:class) if options[:class]

    content_tag(:icon, nil, class: classes.presence&.join(" "), data: { icon: name }, **options)
  end
end
