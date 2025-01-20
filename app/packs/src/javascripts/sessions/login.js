import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import LoginForm from '@/src/javascripts/sessions/LoginForm.vue'

$(document).on('turbo:load turbo:render', () => {
  const loginPage = document.querySelector('#login-page')
  if (loginPage && !loginPage.__vue_app__) {
    createApp({ components: { BaseAlert, LoginForm } }).mount(loginPage)
  }
})
