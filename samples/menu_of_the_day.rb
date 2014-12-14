require 'prawn'
require 'date'

pdf = Prawn::Document.new

pdf.font 'Helvetica'

pdf.define_grid(columns: 5, rows: 8, gutter: 5)
pdf.grid.show_all

pdf.grid([0,1],[0,3]).bounding_box do
  pdf.text 'Hidden Gem', size: 36, align: :center
  pdf.text Date.today.to_s, size: 24, align: :center
end

pdf.grid([1,1],[2,3]).bounding_box do
  pdf.text 'Appetizers', size: 24, align: :center
end

pdf.grid([3,1],[5,3]).bounding_box do
  pdf.text 'Entrees', size: 24, align: :center
end

pdf.grid([6,1],[7,3]).bounding_box do
  pdf.text 'Desserts', size: 24, align: :center
end

pdf.render_file File.expand_path('../../output/menu_of_the_day.pdf', __FILE__)
