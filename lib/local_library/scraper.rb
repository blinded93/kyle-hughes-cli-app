class LocalLibrary::Scraper

  def self.scrape(zip_code)
    address = "https://search.yahoo.com/search?p=public+library+near+#{zip_code}"
    doc = Nokogiri::HTML(open(address))
    ul = doc.css('div.dd')
    
  end


end
