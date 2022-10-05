# frozen_string_literal: true

module BootstrapForm
  module Helpers
    module Bootstrap
      def prepend_and_append_input(name, options, &block)
        options = options.extract!(:prepend, :append, :input_group_class)

        input = capture(&block) || ActiveSupport::SafeBuffer.new

        # input = attach_input(options, :prepend) + input + attach_input(options, :append)
        input = content_tag(:span, options[:prepend], class: 'input-group-addon') + input if options[:prepend]
        input << content_tag(:span, options[:append], class: 'input-group-addon') if options[:append]
        input += generate_error(name)
        options.present? &&
          input = content_tag(:div, input, class: ['input-group', options[:input_group_class]].compact)
        input
      end

      def date_picker(name, options = {})
        date = object.send(name)
        format = options.delete(:format) || '%d/%b/%Y'
        options[:value] = date.strftime(format) if date
        options[:append] = content_tag(:i, nil, class: 'glyphicon glyphicon-th')
        options[:input_group_class] = 'date'
        options[:readonly] = true
        text_field(name, options)
      end
    end
  end
end
