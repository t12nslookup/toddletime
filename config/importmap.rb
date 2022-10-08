# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true

pin 'jquery', to: 'jquery.min.js', preload: true
pin 'jquery_ujs', to: 'jquery_ujs.js', preload: true
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
