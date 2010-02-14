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

module EditableValidatingObjectExtensions
	def notified_attr_accessor *names
		attr_reader *names
		names.each do |name|
			define_method "#{name}=" do |value|
				instance_variable_set "@#{name}", value
				NotifyPropertyChanged name
			end
		end
	end
end

class Cinch::EditableValidatingObject
	extend EditableValidatingObjectExtensions
end

class Test2 < Cinch::EditableValidatingObject
	
	notified_attr_accessor :notify, :list

	def initialize
		self.list = ['a', 'b', 3, 4, Test.new]
		self.notify = Cinch::DataWrapper[String].new
		self.notify.data_value = "TEST"
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