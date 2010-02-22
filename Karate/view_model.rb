require 'Cinch'
require 'model.rb'
require 'Karate'

module ViewModelExtensions
	
	attr_reader :current_view_mode

	def current_view_mode= value
		@current_view_mode = value
		
		is_editable = (value == Cinch::ViewMode.AddMode || value == Cinch::ViewMode.EditMode)

		@current_person.data_wrappers.each { |wrapper| wrapper.is_editable = is_editable}

		NotifyPropertyChanged(:current_view_mode)
	end

end

class AddEditPersonViewModel < Cinch::ViewModelBase
	include NotifiedAttributeAccessorExtension
	include ViewModelExtensions

	notified_attr_accessor :current_person, :save_person_command, :edit_person_command, :cancel_person_command

	def initialize
		self.save_person_command = Cinch::SimpleCommand.new
		self.save_person_command.can_execute_delegate = System::Predicate[Object].new { self.current_person != nil }
		self.save_person_command.execute_delegate = System::Action[Object].new { self.current_view_mode = Cinch::ViewMode.ViewOnlyMode }

		self.edit_person_command = Cinch::SimpleCommand.new
		self.edit_person_command.can_execute_delegate = System::Predicate[Object].new { self.current_person != nil }
		self.edit_person_command.execute_delegate = System::Action[Object].new { self.current_view_mode = Cinch::ViewMode.EditMode }

		self.cancel_person_command = Cinch::SimpleCommand.new
		self.cancel_person_command.can_execute_delegate = System::Predicate[Object].new { self.current_person != nil }
		self.cancel_person_command.execute_delegate = System::Action[Object].new { self.current_person = nil }

		puts Test.new.IsValid
	end
end

class Test < Karate::Models::TestModel
	
	def IsValid
		true
	end
end