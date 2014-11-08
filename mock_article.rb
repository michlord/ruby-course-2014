require_relative  'article'
require 'bla-bla'

class MockArticle < Article
  def initialize
    super(BlaBla.title, BlaBla.content, BlaBla.author)
    @likes, @dislikes = random_number, random_number
  end

  def random_number
    rand 100
  end
end
