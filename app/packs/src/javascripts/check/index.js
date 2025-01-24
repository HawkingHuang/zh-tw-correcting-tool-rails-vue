import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import CheckIndex from '@/src/javascripts/check/CheckIndex.vue'

$(document).on('turbo:load turbo:render', () => {
  const checkPage = document.querySelector('#check-page')
  if (checkPage && !checkPage.__vue_app__) {
    createApp({ components: { BaseAlert, CheckIndex } }).mount(checkPage)
  }
})
