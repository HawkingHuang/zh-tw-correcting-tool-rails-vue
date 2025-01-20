import $ from 'jquery'
window.jQuery = window.$ = $

import '@/src/javascripts/sessions/login.js'
import '@/src/javascripts/registrations/signup.js'
import '@/src/javascripts/customs/index.js'
import '@/src/javascripts/customs/form.js'
import '@/src/javascripts/about/index.js'

import * as Turbo from '@hotwired/turbo'
Turbo.start()
