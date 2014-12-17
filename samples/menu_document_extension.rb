module MenuDocumentExtension
  def detail(detail)
    font('Times-Roman') do
      text detail, size: 12, align: :center
    end
  end
end
