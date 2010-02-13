require 'Karate'
require 'Karate.Data'
require 'NHibernate'
require 'Cinch'

INotifyPropertyChanged = System::ComponentModel::INotifyPropertyChanged
PropertyChangedEventArgs = System::ComponentModel::PropertyChangedEventArgs

class PersonModel < Karate::Data::Entities::Person

	def hello lol
		"Hello from #{name}, #{lol}!"
	end
end

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

class Test2 < Cinch::EditableValidatingObject
	
	def notify
		@notify
	end

	def notify= value
		@notify = value
		NotifyPropertyChanged :notify
	end

	def initialize
		puts methods.join "\n"
	end
end

def hello lol
	p = PersonModel.new
	p.name = "Hitler"
	
	p.hello lol
end

def hibernate
	p = Karate::Data::Entities::Person.new
	p.name = "Mussolini"
	p.birth_date = System::DateTime.now
	
	db = Karate::Data::Database.new
	session = db.session_factory.open_session
	transaction = session.begin_transaction
	
	session.save p
	
	transaction.commit
end