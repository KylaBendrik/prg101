require 'erb'

value = 5

jobs = ['Starbucks', 'WH-BM', 'Space-X']

template = ERB.new <<~HTML
<!DOCTYPE html>
<html lang="en">
  <head>
    <style>
      body {
        background-color: lime;
      }
    </style>
  </head>
  <body>
    <h1>Beth Jackson</h1>
    <p>
      Hi there! You rendered this page with <%= value %>
    </p>
  
    <% jobs.each do |job| %>
      <p><%= job %></p>
    <% end %>
  </body>
</html>
HTML

File.open('resume.html', 'w') do |file|
  file.puts template.result(binding)
end