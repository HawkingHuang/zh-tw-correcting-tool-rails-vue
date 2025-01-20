import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import AboutPage from '@/src/javascripts/About/AboutPage.vue'

$(document).on('turbo:load turbo:render', () => {
  const aboutPage = document.querySelector('#about-page')
  if (aboutPage && !aboutPage.__vue_app__) {
    createApp({ components: { BaseAlert, AboutPage } }).mount(aboutPage)
  }
})
