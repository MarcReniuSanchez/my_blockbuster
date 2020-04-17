# frozen_string_literal: true

require "rails_helper"
require "xml_file_generator"

RSpec.describe XmlFileGenerator do
  let!(:movies) { create_list(:movie, 5) }
  let!(:seasons) { create_list(:season_with_episodes, 3, episodes_count: 3) }

  xit "should return an XML" do
    expect(XmlFileGenerator.generate_xml(media_list)).to eq(xml_response)
  end

  it "should return an XML with movies" do
    expect(XmlFileGenerator.generate_xml(movie_list)).to eq(movies_xml_response)
  end
  it "should return an XML with seasons" do
    expect(XmlFileGenerator.generate_xml(season_list)).to eq(seasons_xml_response)
  end

  def xml_response
    media_list.to_xml
  end

  def movies_xml_response
    movie_list.to_xml
  end

  def seasons_xml_response
    season_list.to_xml
  end
end
