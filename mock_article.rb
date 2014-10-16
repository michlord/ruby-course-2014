require_relative  'article'

class MockArticle < Article
  WORD_LIST = ["about","after","again","air","all",
  "along","also","an","and","another",
  "any","are","around","as","at","away",
  "back","be","because","been","before",
  "below","between","both","but","by",
  "came","can","come","could","day",
  "did","different","do","does","don't",
  "down","each","end","even","every",
  "few","find","first","for","found",
  "from","get","give","go","good","great",
  "had","has","have","he","help","her",
  "here","him","his","home","house","how",
  "I","if","in","into","is","it",
  "its","just","know","large","last","left",
  "like","line","little","long","look","made",
  "make","man","many","may","me","men",
  "might","more","most","Mr.","must","my",
  "name","never","new","next","no","not"]
  def random_word
    WORD_LIST[rand(0..WORD_LIST.length - 1)]
  end
  def random_number
    rand(0..100)
  end
  def generate_author
    random_word.capitalize + " " + random_word.capitalize
  end
  def generate_title
    title = random_word.capitalize
    rand(0..4).times { title += " " + random_word }
    title
  end
  def generate_sentence
    sentence = random_word.capitalize
    rand(4..9).times { sentence += " " + random_word }
    sentence + "."
  end
  def generate_content
    content = generate_sentence
    rand(1..4).times { content += " " + generate_sentence}
    content
  end
  def initialize
    super(generate_title, generate_content, generate_author)
    @likes = random_number
    @dislikes = random_number
  end
end
