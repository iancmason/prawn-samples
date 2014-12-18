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
  pdf.section 'Appetizers'
  pdf.stroke_horizontal_rule
  pdf.item 'Champignon Grille'
  pdf.detail 'grilled portobello mushroom / arugula / cherry tomatoes'
  pdf.item 'P.E.I Mussels'
  pdf.detail 'steamed with leeks / white wine / over garlic bread'

  pdf.section 'Entrees'
  pdf.stroke_horizontal_rule
  pdf.item 'Penne alla Vodka'
  pdf.detail 'vodka sauce / shallots / shiitake mushrooms / asparagus'
  pdf.item 'Seared Yellow Fin Tuna'
  pdf.detail 'marinated cucumber / chopped lettuce / couscous'
  pdf.item 'Rib-Eye Steak - 15 Oz.'
  pdf.detail 'roasted rosemary potatoes / creaned spinach'

  pdf.section 'Desserts'
  pdf.stroke_horizontal_rule
  pdf.item 'Tiramisu'
  pdf.item 'Raspberry Sorbet'
  pdf.item 'Ricotta Cheese Cake'
end

pdf.render_file File.expand_path('../../output/menu_of_the_day.pdf', __FILE__)
