require 'spec_helper'

module Codebreaker
  describe Game do
    let(:output)  { double('output').as_null_object }
    let(:game) { Game.new(output) }

    describe "#start" do
      it "sends a welcome message" do
        expect(output).to receive(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end

      it "prompts for the first guess" do
        expect(output).to receive(:puts).with('Enter guess:')
        game.start('1234')
      end

      context "without a predefined secret" do
        it "should set the secret to four random numbers between 1 and 6" do
          game.start
          expect(game.secret).to match(/[1-6]{4}/)
        end
      end
    end

    describe "#guess" do
      it "sends the mark to output" do
        game.start('1234')
        expect(output).to receive(:puts).with('++++')
        game.guess('1234')
      end
    end
  end
end
