import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import CustomForm from '@/src/javascripts/customs/CustomForm.vue'

$(document).on('turbo:load turbo:render', () => {
  const customForm = document.querySelector('#custom-form')
  if (customForm && !customForm.__vue_app__) {
    createApp({ components: { BaseAlert, CustomForm } }).mount(customForm)
  }
})
