class Feed < ApplicationRecord
  before_create :fetch_first_line_as_a_title

  def formatted_created_at
    created_at.strftime("%Y-%m-%d")
  end

  def fetch_first_line_as_a_title
    title = self.text.split("\n").first
    self.title = title
  end
end
