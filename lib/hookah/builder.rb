module Hookah
  class Builder
    def initialize(target)
      @target = target
    end

    def build
    end

    def event(name)
      m = if @target.const_defined?(:HookahEvents)
            @target.const_get(:HookahEvents)
          else
            @target.const_set(:HookahEvents, Module.new)
          end

      m.module_eval do
        define_method("#{name}!") do |*args|
          call_event_handlers(name, *args)
        end

        define_method("on_#{name}") do |&handler|
          add_event_handler(name, &handler)
        end
      end

      @target.module_eval do
        include m
      end
    end
  end
end
