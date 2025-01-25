<script setup>
import { ref, toRefs, onBeforeMount } from 'vue'
import mySwal from '@/src/javascripts/plugins/mySwal.js'
import BaseCard from '@/src/components/BaseCard.vue'
import BaseTextInput from '@/src/components/BaseTextInput.vue'
import BackButton from '@/src/components/BackButton.vue'
import { SendOutlined } from '@ant-design/icons-vue'

const props = defineProps({
  token: {
    type: String
  },
  customWord: {
    type: Object
  }
})
const { token, customWord } = toRefs(props)
const editCustomWord = ref(customWord.value)

onBeforeMount(() => {
  if (customWord.value.id) {
    editCustomWord.value = customWord.value
  } else {
    editCustomWord.value = {
      correct_word: '',
      incorrect_word: ''
    }
  }
})

const submitForm = () => {
  $.ajax({
    url: editCustomWord.value.id
      ? `/customs/${editCustomWord.value.id}`
      : '/customs',
    type: editCustomWord.value.id ? 'PATCH' : 'POST',
    dataType: 'json',
    headers: { 'X-CSRF-Token': token.value },
    authenticity_token: true,
    data: editCustomWord.value,
    success: async (response) => {
      if (response.state === 0) {
        window.location.replace('/customs')
      }
    },
    error: (error) => {
      console.log('error', error)
      if (error.responseJSON.state === -1) {
        mySwal.error({
          title: error.responseJSON.message
        })
      }
    }
  })
}
</script>

<template>
  <div>
    <base-card>
      <form @submit.prevent="submitForm" class="leave-need-confirm">
        <div class="mb-4 grid grid-cols-2 gap-4 md:grid-cols-1">
          <BaseTextInput
            label="Correct Word"
            name="correct_word"
            v-model="editCustomWord.correct_word"
            maxlength="4"
            required
          />
          <BaseTextInput
            label="Incorrect Word"
            name="incorrect_word"
            v-model="editCustomWord.incorrect_word"
            maxlength="4"
            required
          />
        </div>
        <div class="flex items-center justify-end gap-3 py-3">
          <BackButton :hasForm="true" />
          <button
            type="submit"
            class="default-btn btn-green"
          >
            <SendOutlined />
            Confirm
          </button>
        </div>
      </form>
    </base-card>
  </div>
</template>
