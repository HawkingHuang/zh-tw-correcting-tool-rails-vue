import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import BaseCard from '@/src/components/BaseCard.vue'
import ReportSearch from '@/src/javascripts/reports/ReportSearch.vue'
import { CommentOutlined } from '@ant-design/icons-vue'

$(document).on('turbo:load turbo:render', () => {
  const reportIndex = document.querySelector('#report-index')
  if (reportIndex && !reportIndex.__vue_app__) {
    createApp({ components: { BaseAlert, BaseCard, ReportSearch, CommentOutlined } }).mount(reportIndex)
  }
})
