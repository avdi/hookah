module Hookah
  module DanielIsAwesome
    def add_listener(listener)
    end
    def add_event_handler(event_name, &handler)
	    @hookah_handlers ||= []
	    @hookah_handlers << CallableHandler.new(event_name, handler)
    end
    def call_event_handlers(event_name, *args)
      @hookah_handlers.each do |handler|
        handler.notify(event_name, *args)
      end  	
    end
  end
end
