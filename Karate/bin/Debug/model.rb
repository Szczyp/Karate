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

class PersonModel < Cinch::EditableValidatingObject
	include NotifiedAttributeAccessorExtension

	notified_attr_accessor :name, :address, :data_wrappers

	def initialize
		super

		self.name = DataWrapper.new
		self.name.add_rule Cinch::SimpleRule.new "DataValue", "name can't be empty", System::Func[Object, System::Boolean].new { |object| puts "lol"; object.DataValue.empty? }
		self.address = DataWrapper.new

		self.data_wrappers = [@name, @address]


	end

	def IsValid
		puts "validating"
		self.data_wrappers.all? { |wrapper| wrapper.IsValid }
		false
	end
end