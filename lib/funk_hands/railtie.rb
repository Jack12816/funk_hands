# frozen_string_literal: true

module FunkHands
  class Railtie < Rails::Railtie
    initializer 'FunkHands.initialize' do |app|
      silence_warnings do
        # Friendlier prompt - line number, app name, nesting levels look like
        # directory paths.
        #
        # Heavy use of lazy lambdas so configuration (like Pry.color) can be
        # changed later or even during console usage.
        #
        # Custom color helpers using hints \001 and \002 so that good readline
        # libraries (GNU, rb-readline) correctly ignore color codes when
        # calculating line length.

        color = -> { Pry.color }
        red  = ->(text) { color[] ? "\001\e[0;31m\002#{text}\001\e[0m\002" : text.to_s }
        blue = ->(text) { color[] ? "\001\e[0;34m\002#{text}\001\e[0m\002" : text.to_s }
        bold = ->(text) { color[] ? "\001\e[1m\002#{text}\001\e[0m\002"    : text.to_s }

        name = app.class.module_parent_name \
          if app.class.respond_to?(:module_parent_name)
        name ||= app.class.parent_name
        name = name.underscore.gsub('_', '-')

        separator = red.(defined?(RbReadline) ? '>' : "\u00BB")
        colored_name = blue.(name)

        line = ->(pry) { "[#{bold.(pry.input_ring.size)}] " }
        target_string = ->(object, level) do
          level = 0 if level < 0
          unless (string = Pry.view_clip(object)) == 'main'
            "(#{'../' * level}#{string})"
          else
            ''
          end
        end

        Pry.config.prompt = Pry::Prompt.new(
          'funk_hands',
          'funk_hands',
          [
            # Main prompt
            proc do |object, level, pry|
              "#{line.(pry)}#{colored_name}#{target_string.(object, level)} #{separator} "
            end,

            # Wait prompt in multiline input
            proc do |object, level, pry|
              spaces = ' ' * (
                "[#{pry.input_ring.size}] ".size +  # Uncolored `line.(pry)`
                name.size +
                target_string.(object, level).size
              )
              "#{spaces} #{separator.()} "
            end
          ]
        )
      end
    end
  end
end
