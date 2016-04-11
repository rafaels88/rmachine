require 'r_machine/event'
require 'r_machine/rule'
require 'r_machine/state_template'
require 'r_machine/state_notifier_factory'
require 'r_machine/notifiers/call_event_method_notifier'
require 'r_machine/notifiers/change_state_value_notifier'
require 'r_machine/notifiers/retrieve_state_value_notifier'
require 'r_machine/state_transaction_not_permitted_error'

module RMachine
  def self.included(base)
    base.extend(ClassMethods)
  end

  def method_missing(called_method, *args)
    factory_params = {
      object_called: self,
      state_template: ClassMethods.state_template,
      message_name: called_method,
      message_args: args
    }

    factory = StateNotifierFactory.new factory_params

    if factory.is_notifying_state_machine?
      factory.notifier.notify!
    else
      super
    end
  end

  private

  module ClassMethods
    def r_machine
      @@state_template = StateTemplate.new
      yield @@state_template
    end

    def self.state_template
      @@state_template
    end
  end
end
