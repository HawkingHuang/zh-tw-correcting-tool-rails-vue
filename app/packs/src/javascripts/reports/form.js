import { createApp } from 'vue/dist/vue.esm-bundler.js'
import BaseAlert from '@/src/components/BaseAlert.vue'
import ReportForm from '@/src/javascripts/reports/ReportForm.vue'
import HeaderSection from '@/src/components/HeaderSection.vue'

$(document).on('turbo:load turbo:render', () => {
  const reportForm = document.querySelector('#report-form')
  if (reportForm && !reportForm.__vue_app__) {
    createApp({ components: { BaseAlert, ReportForm, HeaderSection } }).mount(reportForm)
  }
})
