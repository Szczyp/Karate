require 'Cinch'

module NotifiedAttributeAccessorExtension
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
	include NotifiedAttributeAccessorExtension

	notified_attr_accessor :data_value

	def IsDirty
		HasPropertyChanged("data_value")
	end

	def IsDirty= b

	end
end

class ModelBase < Cinch::EditableValidatingObject
	include NotifiedAttributeAccessorExtension

	notified_attr_accessor :data_wrappers

	def initialize *wrappers
		wrappers.each do |wrapper|
			instance_variable_set "@#{wrapper}", DataWrapper.new
		end
		
		@data_wrappers = wrappers.collect { |wrapper| instance_variable_get "@#{wrapper}" }
	end

	def IsValid
		self.data_wrappers.all? { |wrapper| wrapper.IsValid }
	end
end

class PersonModel < ModelBase
	notified_attr_accessor :name, :address

	def initialize
		super :name, :address
		
		self.name.add_rule Cinch::SimpleRule.new "DataValue", "name can't be empty", System::Func[Object, System::Boolean].new { |object| object.data_value.empty? }
	end
end