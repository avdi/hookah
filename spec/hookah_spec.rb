require 'spec_helper'
require 'hookah'

describe Hookah do
  describe "Internal Callbacks" do
    class ZeroWing
      Hookah.enhance(self) do
        event :we_get_signal
        event :all_your_base_are_belong_to_us
      end

      def initialize(probe)
        on_we_get_signal do |message|
          probe << "received: #{message}"
          probe << "WHAT!!!"
        end
        on_all_your_base_are_belong_to_us do
          probe << "What you say!"
        end
      end

      def start_game
        we_get_signal!("How are you gentlemen")
      end
      def aybabtu
        all_your_base_are_belong_to_us!
      end
    end

    let(:probe){[]}
    let(:zw){ZeroWing.new(probe)}
    it "calls internal instance callbacks" do
      zw.start_game
      probe.should include("received: How are you gentlemen")
      probe.should include("WHAT!!!")
    end
    it "differentiates events" do
      zw.aybabtu
      probe.should include("What you say!")
      probe.should_not include ("WHAT!!!")
    end
  end
end


