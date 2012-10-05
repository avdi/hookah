require 'spec_helper'

module Hookah
  describe Builder do
    let(:builder) { Builder.new(target) }
    let(:target)  { Class.new }

    describe '#event' do
      it 'adds an event-firing method' do
        builder.event :foo

        target.new.should respond_to(:foo!)
      end

      it 'adds an callback registration method' do
        builder.event :blah

        target.new.should respond_to(:on_blah)
      end

      it 'does not add methods directly to the target' do
        builder.event :bar
        target.instance_methods(false).should_not include(:bar!, :on_bar!)
      end

      it 'does not clutter up the targets ancestors with lots of modules' do
        ancestor_count = target.ancestors.count
        builder.event :foo
        builder.event :bar
        builder.event :baz
        target.should have(ancestor_count + 1).ancestors
      end
    end
  end
end
