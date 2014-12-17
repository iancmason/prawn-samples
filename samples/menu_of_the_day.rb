require 'prawn'
require 'date'
require_relative './menu_document_extension'

Prawn::Document.extensions << MenuDocumentExtension
pdf = Prawn::Document.new

pdf.font 'Helvetica'
pdf.define_grid(columns: 5, rows: 8, gutter: 5)

pdf.grid([1,1],[1,3]).bounding_box do
  pdf.text 'Hidden Gem', size: 30, align: :center, kerning: true, character_spacing: 2
  pdf.curve [20, 50], [300, 50], bounds: [[115, 60], [205, 40]]
  pdf.pad_top(20) { pdf.text Date.today.to_s, size: 20, align: :center, kerning: true, character_spacing: 2 }
end

pdf.grid([2,1],[6,3]).bounding_box do
  pdf.pad_top(25) { pdf.text 'Appetizers', size: 24, align: :center, kerning: true, character_spacing: 2 }
  pdf.stroke_horizontal_rule
  pdf.pad_top(10) { pdf.text 'Champignon Grille', size: 14, align: :center }
  pdf.detail 'grilled portobello mushroom / arugula / cherry tomatoes'
  pdf.pad_top(10) { pdf.text 'P.E.I Mussels', size: 14, align: :center }
  pdf.detail 'steamed with leeks / white wine / over garlic bread'

  pdf.pad_top(25) { pdf.text 'Entrees', size: 24, align: :center, kerning: true, character_spacing: 2 }
  pdf.stroke_horizontal_rule
  pdf.pad_top(10) { pdf.text 'Penne alla Vodka', size: 14, align: :center }
  pdf.detail 'vodka sauce / shallots / shiitake mushrooms / asparagus'
  pdf.pad_top(10) { pdf.text 'Seared Yellow Fin Tuna', size: 14, align: :center }
  pdf.detail 'marinated cucumber / chopped lettuce / couscous'
  pdf.pad_top(10) { pdf.text 'Rib-Eye Steak - 15 Oz.', size: 14, align: :center }
  pdf.detail 'roasted rosemary potatoes / creaned spinach'

  pdf.pad_top(25) { pdf.text 'Desserts', size: 24, align: :center, kerning: true, character_spacing: 2 }
  pdf.stroke_horizontal_rule
  pdf.pad_top(10) { pdf.text 'Tiramisu', size: 14, align: :center }
  pdf.pad_top(10) { pdf.text 'Raspberry Sorbet', size: 14, align: :center }
  pdf.pad_top(10) { pdf.text 'Ricotta Cheese Cake', size: 14, align: :center }
end

pdf.render_file File.expand_path('../../output/menu_of_the_day.pdf', __FILE__)
