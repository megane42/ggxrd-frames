require "ggxrd/frames/version"
require "ggxrd/frames/characters"
require "ggxrd/frames/column"
require "mechanize"

module GGXrd
  class Frames
    def frame_of (character)

      raise ArgumentError unless character.is_a?(Symbol) || character.is_a?(String)

      character = character.to_sym

      raise ArgumentError unless GGXrd::Frames::CHARACTERS[character]

      url = GGXrd::Frames::CHARACTERS[character][:url]
      res = Mechanize.new.get(url)

      # scraping
      table = res.at(GGXrd::Frames::CHARACTERS[character][:selector])
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
