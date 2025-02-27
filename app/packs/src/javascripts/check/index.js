import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import CheckIndex from '@/src/javascripts/check/CheckIndex.vue'
import HeaderSection from '@/src/components/HeaderSection.vue'

$(document).on('turbo:load turbo:render', () => {
  const checkPage = document.querySelector('#check-page')
  if (checkPage && !checkPage.__vue_app__) {
    createApp({ components: { BaseAlert, CheckIndex, HeaderSection } }).mount(checkPage)
  }
})
