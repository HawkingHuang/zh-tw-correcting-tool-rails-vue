<script setup>
import { ref, toRefs, onBeforeMount } from 'vue'
import mySwal from '@/src/javascripts/plugins/mySwal.js'
import BaseCard from '@/src/components/BaseCard.vue'
import BaseSelect from '@/src/components/BaseSelect.vue'
import BaseTextInput from '@/src/components/BaseTextInput.vue'
import BackButton from '@/src/components/BackButton.vue'
import { SendOutlined } from '@ant-design/icons-vue'
import dayjs from 'dayjs'

const searchInfo = ref({
  category: '',
  word: ''
})

const props = defineProps({
  token: {
    type: String
  },
  reportWord: {
    type: Object
  },
  replies: {
    type: Array
  }
})
const { token, reportWord, replies } = toRefs(props)
const editReportWord = ref({})

const categoryList = [
  { value: 'bpmf1', label: 'ㄅ' },
  { value: 'bpmf2', label: 'ㄆ' },
  { value: 'bpmf3', label: 'ㄇ' },
  { value: 'bpmf4', label: 'ㄈ' },
  { value: 'bpmf5', label: 'ㄉ' },
  { value: 'bpmf6', label: 'ㄊ' },
  { value: 'bpmf7', label: 'ㄋ' },
  { value: 'bpmf8', label: 'ㄌ' },
  { value: 'bpmf9', label: 'ㄍ' },
  { value: 'bpmf10', label: 'ㄎ' },
  { value: 'bpmf11', label: 'ㄏ' },
  { value: 'bpmf12', label: 'ㄐ' },
  { value: 'bpmf13', label: 'ㄑ' },
  { value: 'bpmf14', label: 'ㄒ' },
  { value: 'bpmf15', label: 'ㄓ' },
  { value: 'bpmf16', label: 'ㄔ' },
  { value: 'bpmf17', label: 'ㄕ' },
  { value: 'bpmf18', label: 'ㄖ' },
  { value: 'bpmf19', label: 'ㄗ' },
  { value: 'bpmf20', label: 'ㄘ' },
  { value: 'bpmf21', label: 'ㄙ' },
  { value: 'bpmf22', label: 'ㄧ' },
  { value: 'bpmf23', label: 'ㄨ' },
  { value: 'bpmf24', label: 'ㄩ' },
  { value: 'bpmf25', label: 'ㄚ' },
  { value: 'bpmf26', label: 'ㄛ' },
  { value: 'bpmf27', label: 'ㄜ' },
  { value: 'bpmf28', label: 'ㄝ' },
  { value: 'bpmf29', label: 'ㄞ' },
  { value: 'bpmf30', label: 'ㄟ' },
  { value: 'bpmf31', label: 'ㄠ' },
  { value: 'bpmf32', label: 'ㄡ' },
  { value: 'bpmf33', label: 'ㄢ' },
  { value: 'bpmf34', label: 'ㄣ' },
  { value: 'bpmf35', label: 'ㄤ' },
  { value: 'bpmf36', label: 'ㄥ' },
  { value: 'bpmf37', label: 'ㄦ' }
]

const wordList = ref([])

onBeforeMount(() => {
  if (reportWord.value.id) {
    editReportWord.value = {
      ...reportWord.value,
      response: ''
    }
  } else {
    editReportWord.value = {
      correct_word: '',
      incorrect_word: '',
      response: ''
    }
  }
})

const getWordList = (category) => {
  wordList.value = []
  searchInfo.value.word = ''
  editReportWord.value.correct_word = ''
  editReportWord.value.incorrect_word = ''

  $.ajax({
    url: `/reports/words/${category}`,
    type: 'GET',
    dataType: 'json',
    success: (response) => {
      wordList.value = response.map((word) => {
        return {
          value: `${word.correct_word}／${word.incorrect_word}`,
          label: `${word.correct_word}／${word.incorrect_word}`
        }
      })
      searchInfo.value.word = wordList.value[0].value
      fillInWords(wordList.value[0].value)
    }
  })
}

const fillInWords = (words) => {
  const correctPart = words.split('／')[0]
  const incorrectPart = words.split('／')[1]
  editReportWord.value.correct_word = correctPart
  editReportWord.value.incorrect_word = incorrectPart
}

const submitForm = () => {
  const reportData = {
    report: {
      correct_word: editReportWord.value.correct_word,
      incorrect_word: editReportWord.value.incorrect_word,
      response: editReportWord.value.response
    }
  }

  $.ajax({
    url: editReportWord.value.id
      ? `/reports/${editReportWord.value.id}`
      : '/reports',
    type: editReportWord.value.id ? 'PATCH' : 'POST',
    dataType: 'json',
    contentType: 'application/json',
    headers: { 'X-CSRF-Token': token.value },
    authenticity_token: true,
    data: JSON.stringify(reportData),
    success: async (response) => {
      if (response.state === 0) {
        window.location.replace('/reports')
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
      <div v-if="!editReportWord.id" class="mb-4 flex gap-2">
        <BaseSelect
          label="Bopomofo"
          name="category"
          :optionList="categoryList"
          :optionsSelected="searchInfo.category"
          @change="getWordList($event)"
          @select="searchInfo.category = $event"
        />
        <BaseSelect
          label="Correct/Incorrect"
          name="word"
          :optionList="wordList"
          :optionsSelected="searchInfo.word"
          @change="fillInWords($event)"
          @select="searchInfo.word = $event"
        />
      </div>

      <div v-else class="custom-scroll mb-4 max-h-[38vh] flex-auto overflow-y-auto overflow-x-hidden rounded md:max-h-none md:min-h-0 md:w-full md:overflow-visible">
        <table class="w-full whitespace-nowrap border-b border-solid border-b-gray-200 text-center align-middle text-lg md:min-w-[200px]">
          <thead class="sticky -top-1 z-[100] md:hidden">
            <tr class="bg-slate-200 text-xl text-black">
              <th class="w-1/4 p-4 text-left">Informant/Respondent</th>
              <th class="w-1/2 p-4 text-left">Content</th>
              <th class="w-1/4 p-4 text-left">Time</th>
            </tr>
          </thead>
          <tbody class="md:flex md:flex-col">
            <tr v-for="(reply, index) in replies" :key="index" class="border-b-2 border-gray-200 hover:bg-gray-200 md:grid md:grid-cols-3">
              <td data-title="Informant/Respondent" class="px-4 py-2 text-left md:col-span-3">{{ reply.username }}</td>
              <td data-title="Content" class="px-4 py-2 text-left md:col-span-3">
                <div class="flex items-center whitespace-pre-wrap">{{ reply.response }}</div>
              </td>
              <td data-title="Time" class="px-4 py-2 text-left md:col-span-3">{{ dayjs(reply.created_at).format('YYYY-MM-DD') }}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <form @submit.prevent="submitForm" class="leave-need-confirm">
        <div v-if="!editReportWord.id" class="mb-4 grid grid-cols-2 gap-4 md:grid-cols-1">
          <BaseTextInput
            label="Correct Word"
            name="correct_word"
            v-model="editReportWord.correct_word"
            maxlength="4"
            required
          />
          <BaseTextInput
            label="Incorrect Word"
            name="incorrect_word"
            v-model="editReportWord.incorrect_word"
            maxlength="4"
            required
          />
        </div>
        <div>
          <div class="flex items-baseline gap-1 py-1">
            <span class="text-lg font-bold">
              Response
              <span class="text-sm font-light text-red-400">*</span>
            </span>
          </div>
          <textarea
            name="response"
            :value="editReportWord.response"
            @change="editReportWord.response = $event.target.value"
            class="w-full resize-none rounded-md border"
            cols="30"
            rows="4"
            maxlength="50"
            required
          ></textarea>
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
