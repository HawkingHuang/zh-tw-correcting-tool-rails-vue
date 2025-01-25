import $ from 'jquery'
window.jQuery = window.$ = $

import mySwal from '@/src/javascripts/plugins/mySwal.js'
import '@/src/javascripts/sessions/login.js'
import '@/src/javascripts/registrations/signup.js'
import '@/src/javascripts/check/index.js'
import '@/src/javascripts/customs/index.js'
import '@/src/javascripts/customs/form.js'
import '@/src/javascripts/libraries/index.js'
import '@/src/javascripts/reports/index.js'
import '@/src/javascripts/reports/form.js'
import '@/src/javascripts/about/index.js'

import * as Turbo from '@hotwired/turbo'
Turbo.start()

$(document).on('turbo:load turbo:render', () => {
  const $formElement = $('form.leave-need-confirm')

  if ($formElement.length) {
    $(document).on('turbo:before-visit', async (event) => {
      event.preventDefault()

      const isConfirm = await mySwal.confirm({
        title: 'There are unsaved changes. Are you sure to leave?',
        confirmButtonText: 'Confirm',
        cancelButtonText: 'Cancel',
        confirmButtonColor: '#0e3884'
      })

      if (isConfirm) {
        $(document).off('turbo:before-visit')
        const targetUrl = event.originalEvent.detail.url
        Turbo.visit(targetUrl)
      }
    })
  }
  window.addEventListener('popstate', () => {
    $(document).off('turbo:before-visit')
  })
})
