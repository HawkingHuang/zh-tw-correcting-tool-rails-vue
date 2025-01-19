<script setup>
import { toRefs, onMounted } from 'vue'
import swal from 'sweetalert2'
const props = defineProps({
  title: {
    type: [String],
    required: true
  },
  text: {
    type: String,
    required: false
  },
  icon: {
    type: String,
    default: 'success'
  },
  type: {
    type: String,
    default: 'toast'
  }
})
const { title, text, icon, type } = toRefs(props)

const customStyleClass = 'customSwal'
const mixinSwal = swal.mixin({
  title: '',
  text: '',
  customClass: {
    container: customStyleClass
  },
  buttonsStyling: true,
  confirmButtonText: '確認',
  cancelButtonText: '取消'
})
mixinSwal.simpleLoading = function (title = undefined) {
  if (typeof title === 'boolean' && !title) {
    mixinSwal.close()
    return false
  }
  let containerClass = title ? 'simpleLoading withTitle' : 'simpleLoading'
  containerClass += ` ${customStyleClass}`
  mixinSwal.fire({
    title,
    text: '',
    allowOutsideClick: false,
    customClass: {
      container: containerClass
    },
    didOpen: () => {
      mixinSwal.showLoading()
    }
  })
}
mixinSwal.confirm = async function (opt = { title: '', text: '' }) {
  return await mixinSwal
    .fire({
      ...opt,
      ...{
        icon: 'question',
        showCancelButton: true,
        focusCancel: true
      }
    })
    .then((result) => {
      return result.isConfirmed
    })
}
mixinSwal.input = async function (opt) {
  return await mixinSwal.fire({
    ...{
      input: 'text',
      showCancelButton: true
    },
    ...opt
  })
}
mixinSwal.error = async function (opt = { title: '', text: '' }) {
  return mixinSwal.fire({
    ...opt,
    ...{
      icon: 'error'
    }
  })
}
mixinSwal.success = async function (opt = { title: '', text: '' }) {
  return mixinSwal.fire({
    ...opt,
    ...{
      icon: 'success',
      timer: 3000
    }
  })
}
mixinSwal.toast = async function (opt) {
  return mixinSwal.fire({
    ...{
      toast: true,
      position: 'top-end',
      customClass: {
        container: 'toast'
      },
      showConfirmButton: false,
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', swal.stopTimer)
        toast.addEventListener('mouseleave', swal.resumeTimer)
        toast.addEventListener('click', () => {
          swal.close()
          swal.toggleTimer()
        })
      }
    },
    ...opt
  })
}

onMounted(() => {
  if (mixinSwal[type.value] !== undefined) {
    mixinSwal[type.value]({
      icon: icon.value,
      title: title.value,
      text: text.value
    })
  }
})
</script>
<template>
  <div></div>
</template>
