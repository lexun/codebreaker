module Codebreaker
  class Game
    attr_reader :secret

    def initialize(output)
      @output = output
    end

    def start(secret = random)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      marker = Marker.new(@secret, guess)
      @output.puts '+' * marker.exact_match_count +
                   '-' * marker.number_match_count
    end

    private

    def random
      4.times.collect { rand(5) + 1 }.join('')
    end
  end
end
