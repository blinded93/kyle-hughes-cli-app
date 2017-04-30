class LocalLibrary::CLI
  def call
    puts ""
    puts "-------------------- Welcome to the Local library finder --------------------"
    # puts ""
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

  end

  def list(zip_code)
    LocalLibrary::Library.clear
    puts ""
    puts "...Public libraries near #{zip_code}..."
    library = LocalLibrary::Scraper.scrape_and_create(zip_code)

    LocalLibrary::Library.libraries.each.with_index(1) do |library, i|
      puts "#{i}. #{library.branch}"
    end

  end


  def details(zip_code)
      puts ""
      puts "...Preparing branch details..."

      puts "#{LocalLibrary::Library.libraries[zip_code.to_i-1].branch}"
      puts "  #{LocalLibrary::Library.libraries[zip_code.to_i-1].phone}"
      puts "  #{LocalLibrary::Library.libraries[zip_code.to_i-1].address}"
      puts "  #{LocalLibrary::Library.libraries[zip_code.to_i-1].status}"

  end
end
