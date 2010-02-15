class Test
	include INotifyPropertyChanged

	attr_accessor :test

	def notify
		@notify
	end

	def notify= n
		@notify = n
		on_PropertyChanged :notify
	end

	def initialize
		@property_changed_handlers = []
	end

	def add_PropertyChanged handler
		@property_changed_handlers << handler
	end

	def remove_PropertyChanged handler
		@property_changed_handlers.delete handler
	end

	def on_PropertyChanged property_name
		@property_changed_handlers.each { |handler| handler.Invoke self, PropertyChangedEventArgs.new(property_name) }
	end
end