class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  Codebreaker::Game.new(output).start
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

Then /^the secret should be four random numbers$/ do
  @game = Codebreaker::Game.new(output)
  @game.start
  @game.secret.should match(/\d{4}/)
end

Given /^the secret code is "([^"]*)"$/ do |secret|
  @game = Codebreaker::Game.new(output)
  @game.start(secret)
end

When /^I guess "([^"]*)"$/ do |guess|
  @game.guess(guess)
end

Then /^the mark should be "([^"]*)"$/ do |mark|
  output.messages.should include(mark)
end
