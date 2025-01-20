import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import SignupForm from '@/src/javascripts/registrations/SignupForm.vue'

$(document).on('turbo:load turbo:render', () => {
  const signupPage = document.querySelector('#signup-page')
  if (signupPage && !signupPage.__vue_app__) {
    createApp({ components: { BaseAlert, SignupForm } }).mount(signupPage)
  }
})
