require 'spec_helper'
require 'hookah'

describe Hookah do
  class ZeroWing
    Hookah.enhance(self) do
      event :we_get_signal, :message
    end

    def start_game
      we_get_signal!("How are you gentlemen")
    end
  end

  specify 'external instance listeners' do
    pending 'completion of builder'
    listener = double.as_null_object
    zw = ZeroWing.new
    zw.add_listener(listener)

    listener.should_receive(:on_we_get_signal).
      with("How are you gentlemen")
    zw.start_game
  end
end

# listener = ZeroWingListener.new
# zw = ZeroWing.new
# zw.add_listener(listener)

# zw.start_game
