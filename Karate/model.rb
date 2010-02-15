require 'Cinch'

module EditableValidatingObjectExtensions	
	module ClassMethods
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

	def self.included base
		base.extend ClassMethods
	end

	def initialize *params, &block
		super
	end
end

class DataWrapper < Cinch::DataWrapperBase
	include EditableValidatingObjectExtensions

	notified_attr_accessor :data_value

	def IsDirty
		HasPropertyChanged("data_value")
	end

	def IsDirty= b

	end
end

class PersonModel < Cinch::EditableValidatingObject
	include EditableValidatingObjectExtensions

	notified_attr_accessor :name, :address, :list

	def initialize
		super

		puts instance_variables.join "\n"

		self.list = ['a', 'b', 3, 4]

		self.name = DataWrapper.new
		self.address = DataWrapper.new

		@data_wrappers = [@name, @address]

		self.name.data_value = "NAME"
		self.address.data_value = "ADDRESS"
	end
end