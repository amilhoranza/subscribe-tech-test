# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# url = 'https://www.uol.com.br'
# doc = Nokogiri::HTML(URI.open(url))

# title = doc.css('title').text
# puts "Title: #{title}"

# doc.css('p').each do |paragraph|
#   puts paragraph.text
# end

html = <<-HTML
  <html>
    <body>
      <h1>Hello, World!</h1>
      <p>This is a sample paragraph.</p>
    </body>
  </html>
HTML

doc = Nokogiri::HTML(html)

heading = doc.at_css('h1').text
puts "Heading: #{heading}"

paragraph = doc.at_css('p').text
puts "Paragraph: #{paragraph}"

html = <<-HTML
  <div class="post">
    <h2>Post Title</h2>
    <span class="author">Author Name</span>
    <p class="content">This is the post content.</p>
  </div>
HTML

doc = Nokogiri::HTML(html)

# Usando CSS para selecionar o título e autor
title = doc.css('.post h2').text
author = doc.css('.post .author').text
puts "Title: #{title}, Author: #{author}"

# Usando XPath para selecionar o conteúdo do post
content = doc.xpath('//div[@class="post"]/p[@class="content"]').text
puts "Content: #{content}"

html = <<-HTML
  <html>
    <body>
      <a href="https://example.com/page1">Page 1</a>
      <a href="https://example.com/page2">Page 2</a>
    </body>
  </html>
HTML

doc = Nokogiri::HTML(html)

doc.css('a').each do |link|
  puts "Link text: #{link.text}, URL: #{link['href']}"
end

html = <<-HTML
  <html>
    <body>
      <h1>Original Heading</h1>
    </body>
  </html>
HTML

doc = Nokogiri::HTML(html)

# Adicionar um novo parágrafo ao final do <body>
new_paragraph = Nokogiri::XML::Node.new('p', doc)
new_paragraph.content = 'This is a new paragraph added to the document.'
doc.at('body').add_child(new_paragraph)

puts doc.to_html

html = <<-HTML
  <table>
    <tr><th>Product</th><th>Price</th></tr>
    <tr><td>Product A</td><td>$10</td></tr>
    <tr><td>Product B</td><td>$20</td></tr>
  </table>
HTML

doc = Nokogiri::HTML(html)

# Extrair dados da tabela
rows = doc.css('table tr')
rows.each do |row|
  cells = row.css('th, td').map(&:text)
  puts cells.join(' | ')
end

xml = <<-XML
  <books>
    <book>
      <title>Book Title 1</title>
      <author>Author 1</author>
    </book>
    <book>
      <title>Book Title 2</title>
      <author>Author 2</author>
    </book>
  </books>
XML

doc = Nokogiri::XML(xml)

# Extrair títulos e autores
doc.xpath('//book').each do |book|
  title = book.at_xpath('title').text
  author = book.at_xpath('author').text
  puts "Title: #{title}, Author: #{author}"
end

url = 'https://postos.freepostos.com.br'
doc = Nokogiri::HTML(URI.open(url).read, nil, 'UTF-8')
puts doc.text
