module MenuDocumentExtension
  def detail(detail_description)
    font('Times-Roman') do
      text detail_description, size: 12, align: :center
    end
  end

  def item(item_name)
    pad_top(10) { text item_name, size: 14, align: :center }
  end

  def section(section_name)
    pad_top(25) { text section_name, size: 24, align: :center, kerning: true, character_spacing: 2 }
  end
end
