class StylesheetManipulator
  def self.get_random_stylesheet
    stylesheet = "styles" + (rand(2) + 1).to_s + ".css"
  end
end
