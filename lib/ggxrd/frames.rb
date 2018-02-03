require "ggxrd/frames/version"
require "ggxrd/frames/characters"
require "ggxrd/frames/column"
require "ggxrd/frames/error"
require "mechanize"

module GGXrd
  class Frames
    def frame_of (character)

      raise ArgumentError.new('The argument must be a String or a Symbol') unless character.is_a?(String) || character.is_a?(Symbol)

      character = character.to_sym

      raise ArgumentError.new('The argument must be an abbrev of a character name, like "SO", "KY", ...') unless GGXrd::Frames::CHARACTERS[character]

      url = GGXrd::Frames::CHARACTERS[character][:url]
      res = Mechanize.new.get(url)

      # scraping
      table = res.at(GGXrd::Frames::CHARACTERS[character][:selector])
      raise GGXrd::Frames::ScrapingError.new('Frame data is "Download Complete", but failed to scrape it') unless table

      data = (
        table.search('tr').to_a.map do |row|
          row.search('td').to_a.map do |el|
            (el.at('img') ? el.at('img').attribute('alt') : '').to_s + el.content.strip
          end
        end
      )

      # screening
      data.select! {|row| row != []}

      # convert to hash
      data.map do |row|
        Hash[*([GGXrd::Frames::COLUMN, row].transpose.flatten)]
      end
    end
  end
end
