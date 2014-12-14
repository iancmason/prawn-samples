require 'prawn'
require 'date'

pdf = Prawn::Document.new

pdf.font 'Helvetica'

pdf.define_grid(columns: 5, rows: 8, gutter: 5)
pdf.grid.show_all

pdf.render_file File.expand_path('../../output/menu_of_the_day.pdf', __FILE__)
