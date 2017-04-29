class LocalLibrary::Scraper

  def self.scrape_and_create(zip_code)
    address = "https://search.yahoo.com/search?p=public+library+near+#{zip_code}"
    doc = Nokogiri::HTML(open(address))
    ul = doc.css('div.dd')
    ul.css('li.list').each do |a|
      library = LocalLibrary::Library.new(a.css('div.titlewrapper a').text)
      a.css('div.meta span.col.isopen').text == "Open" ? library.status = "Open" : library.status = "Closed"
      library.address = a.css('div.contact span.addr').text
      library.phone = a.css('div.contact span.hoo span')[1].text
      LocalLibrary::Library.libraries << library
    end
  end


end
