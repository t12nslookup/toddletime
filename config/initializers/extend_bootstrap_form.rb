module BootstrapForm
  module Helpers
    module Bootstrap

      def prepend_and_append_input(options, &block)
        options = options.extract!(:prepend, :append, :input_group_class)
        input = capture(&block)

        input = content_tag(:span, options[:prepend], class: 'input-group-addon') + input if options[:prepend]
        input << content_tag(:span, options[:append], class: 'input-group-addon') if options[:append]
        input = content_tag(:div, input, class: "input-group #{options[:input_group_class]}") if options[:prepend] || options[:append]
        input
      end

    end
  end
end
