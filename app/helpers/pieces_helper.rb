module PiecesHelper
  def typeahead_js(css_class, name)
    "$('#{css_class}').typeahead({name: '#{name}', remote: '/pieces/typeahead_search?key=#{name}&q=%QUERY'});".html_safe
  end
end
