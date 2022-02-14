def tag(name)
  print "<#{name}>"
  print yield
  print "</#{name}>"
end

tag(:h3) { "Breaking News!" }

tag(:ul) do
  tag(:li) { "It sparkles!" }
  tag(:li) { "It shines!" }
  tag(:li) { "It mesmerizes!" }
end
