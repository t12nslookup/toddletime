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

      def date_picker(name, options = {})
        date = self.object.send(name)
        format = options.delete(:format) || "%d/%b/%Y"
        options[:value] = date.strftime(format) if date
        options[:append] = content_tag(:i, nil, class: 'glyphicon glyphicon-th')
        options[:input_group_class] = 'date'
        options[:readonly] = true
        text_field(name, options)
      end
    end
  end
end
