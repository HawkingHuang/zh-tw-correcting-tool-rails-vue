<script setup>
import { toRefs } from 'vue'
import { RollbackOutlined } from '@ant-design/icons-vue'
import mySwal from '@/src/javascripts/plugins/mySwal.js'

const props = defineProps({
  hasForm: {
    type: Boolean,
    default: false
  }
})

const { hasForm } = toRefs(props)

const goBack = async () => {
  if (hasForm.value) {
    const isConfirm = await mySwal.confirm({
      title: 'There are unsaved changes. Are you sure to go back?',
      confirmButtonText: 'Send me back',
      cancelButtonText: 'Cancel',
      confirmButtonColor: '#0e3884'
    })

    if (isConfirm) {
      window.history.back()
    }
  } else {
    window.history.back()
  }
}
</script>
<template>
  <div class="flex justify-end gap-3 py-3">
    <button @click="goBack" type="button" class="default-btn btn-gray">
      <RollbackOutlined />
      Go Back
    </button>
  </div>
</template>
