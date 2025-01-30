import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import LibraryIndex from '@/src/javascripts/libraries/LibraryIndex.vue'
import HeaderSection from '@/src/components/HeaderSection.vue'

$(document).on('turbo:load turbo:render', () => {
  const libraryPage = document.querySelector('#library-page')
  if (libraryPage && !libraryPage.__vue_app__) {
    createApp({ components: { BaseAlert, LibraryIndex, HeaderSection } }).mount(libraryPage)
  }
})
