class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers = extract_numbers(input)
    check_negatives(numbers)
    numbers.sum
  end

  private

  def extract_numbers(input)
    delimiter = extract_delimiter(input)
    input = input.gsub(/\/\/.\n/, '') # Remove delimiter declaration
    input.gsub!("\n", ',') # Replace newline characters with comma
    input.split(delimiter).map(&:to_i)
  end

  def extract_delimiter(input)
    match = input.match(/^\/\/(.)\n/)
    return ',' unless match

    Regexp.escape(match[1])
  end

  def check_negatives(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
  end
end
