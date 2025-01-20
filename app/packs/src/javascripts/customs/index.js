import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import CustomIndex from '@/src/javascripts/customs/CustomIndex.vue'
import BaseCard from '@/src/components/BaseCard.vue'
import { EditOutlined } from '@ant-design/icons-vue'

$(document).on('turbo:load turbo:render', () => {
  const customIndex = document.querySelector('#custom-index')
  if (customIndex && !customIndex.__vue_app__) {
    createApp({ components: { BaseAlert, CustomIndex, BaseCard, EditOutlined } }).mount(customIndex)
  }
})
