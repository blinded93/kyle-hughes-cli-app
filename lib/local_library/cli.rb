class LocalLibrary::CLI

  def call
    puts ""
    puts "____________________ Welcome to the Local Library Finder ____________________"
    puts "Please enter a zip code to find the nearest library or 'exit' to exit program."
    puts ""
    start
  end

  def start
    zip_code = nil
    while zip_code != 'exit'
      zip_code = gets.strip
      choice(zip_code)
    end
  end

  def choice(zip_code)
    if zip_code.length == 5 && ZIPS.include?(zip_code)
      list(zip_code)
      puts ""
      puts "Please enter the branch number you would like more information on or 'exit' to exit program."
    elsif zip_code.length == 1 && zip_code.to_i.between?(1, LocalLibrary::Library.libraries.length)
      details(zip_code)
      puts ""
      puts "Please enter another branch nummber, zip code or 'exit' to exit program."
    elsif zip_code == 'exit'
      puts ""
      puts "Thank you for using the Local Library Finder.  Keep on learning."
    else
      puts "That is not a valid entry, please try again, or type 'exit' to exit program."
    end
  end

  def list(zip_code)
    LocalLibrary::Library.clear
    puts ""
    puts "...Public libraries near #{zip_code}..."
    library = LocalLibrary::Scraper.scrape_and_create(zip_code)
      puts "_____________________________________________________________________________"
    LocalLibrary::Library.libraries.each.with_index(1) do |library, i|
      puts "#{i}. #{library.branch}"
    end
      puts "_____________________________________________________________________________"
  end

  def details(zip_code)
      puts ""
      puts "...Preparing branch details..."
      puts "_____________________________________________________________________________"
      puts "#{LocalLibrary::Library.libraries[zip_code.to_i-1].branch}"
      puts "  #{LocalLibrary::Library.libraries[zip_code.to_i-1].phone}"
      puts "  #{LocalLibrary::Library.libraries[zip_code.to_i-1].address}"
      puts "  #{LocalLibrary::Library.libraries[zip_code.to_i-1].status}"
      puts "_____________________________________________________________________________"
  end
end
