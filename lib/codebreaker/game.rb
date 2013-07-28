module Codebreaker
  class Game
    attr_accessor :secret

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
      (1000 + rand(8999)).to_s
    end
  end
end
