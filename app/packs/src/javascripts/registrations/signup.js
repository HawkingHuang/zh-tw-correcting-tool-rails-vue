import { createApp } from 'vue/dist/vue.esm-bundler.js'
import SignupForm from '@/src/javascripts/registrations/SignupForm.vue'

$(document).on('turbo:load turbo:render', () => {
  const signupPage = document.querySelector('#signup-page')
  if (signupPage && !signupPage.__vue_app__) {
    createApp({ components: { SignupForm } }).mount(signupPage)
  }
})
