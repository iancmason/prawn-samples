require 'prawn'
require 'date'

pdf = Prawn::Document.new

pdf.font 'Helvetica'

pdf.define_grid(columns: 5, rows: 8, gutter: 5)
#pdf.grid.show_all

pdf.grid([1,1],[1,3]).bounding_box do
  pdf.text 'Hidden Gem', size: 30, align: :center
  pdf.text Date.today.to_s, size: 20, align: :center
end

pdf.grid([2,1],[6,3]).bounding_box do
  pdf.pad_top(25) { pdf.text 'Appetizers', size: 24, align: :center }
  pdf.stroke_horizontal_rule
  pdf.pad_top(10) { pdf.text 'Champignon Grille', size: 14, align: :center }
  pdf.font('Times-Roman') do
    pdf.text 'grilled portobello mushroom / arugula / cherry tomatoes', size: 12, align: :center
  end
  pdf.pad_top(10) { pdf.text 'P.E.I Mussels', size: 14, align: :center }
  pdf.font('Times-Roman') do
    pdf.text 'steamed with leeks / white wine / over garlic bread', size: 12, align: :center
  end

  pdf.pad_top(25) { pdf.text 'Entrees', size: 24, align: :center }
  pdf.stroke_horizontal_rule
  pdf.pad_top(10) { pdf.text 'Penne alla Vodka', size: 14, align: :center }
  pdf.font('Times-Roman') do
    pdf.text 'vodka sauce / shallots / shiitake mushrooms / asparagus', size: 12, align: :center
  end
  pdf.pad_top(10) { pdf.text 'Seared Yellow Fin Tuna', size: 14, align: :center }
  pdf.font('Times-Roman') do
    pdf.text 'marinated cucumber / chopped lettuce / couscous', size: 12, align: :center
  end
  pdf.pad_top(10) { pdf.text 'Rib-Eye Steak - 15 Oz.', size: 14, align: :center }
  pdf.font('Times-Roman') do
    pdf.text 'roasted rosemary potatoes / creaned spinach', size: 12, align: :center
  end

  pdf.pad_top(25) { pdf.text 'Desserts', size: 24, align: :center }
  pdf.stroke_horizontal_rule
  pdf.pad_top(10) { pdf.text 'Tiramisu', size: 14, align: :center }
  pdf.pad_top(10) { pdf.text 'Raspberry Sorbet', size: 14, align: :center }
  pdf.pad_top(10) { pdf.text 'Ricotta Cheese Cake', size: 14, align: :center }
end

pdf.render_file File.expand_path('../../output/menu_of_the_day.pdf', __FILE__)
