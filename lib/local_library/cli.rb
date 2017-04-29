class LocalLibrary::CLI
  def call
    puts ""
    puts "Welcome to the local library finder"
    puts "Please enter a zip code to find the nearest library or 'exit' to exit program."
    puts ""
    start
  end

  def start
    zip_code = nil
    while zip_code != 'exit'
      zip_code = gets.strip
      if ZIPS.include?(zip_code)
        library = LocalLibrary::Scraper
  end

end
