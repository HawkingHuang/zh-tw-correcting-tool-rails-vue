<script setup>
import { ref, toRefs } from 'vue'
import BaseCard from '@/src/components/BaseCard.vue'
import { CheckCircleOutlined, ClearOutlined } from '@ant-design/icons-vue'

const props = defineProps({
  allWords: {
    type: Array
  }
})

const { allWords } = toRefs(props)
const userInput = ref('')

const examine = () => {
  let correctedText = userInput.value
  allWords.value.forEach((word) => {
    const regex = new RegExp(word.incorrect_word, 'gi')
    correctedText = correctedText.replace(
      regex,
      `<span class="text-red-500 inline-block">${word.correct_word}</span>`
    )
  })

  const resultContainer = document.getElementById('result-text')
  resultContainer.innerHTML = correctedText
}

const reset = () => {
  userInput.value = ''
  const resultContainer = document.getElementById('result-text')
  resultContainer.innerHTML = ''
}

</script>

<template>
  <div>
    <base-card>
      <div>
        <section class="mx-auto my-6 grid max-w-[185rem] grid-cols-2 place-items-center md:mt-0">
          <div class="w-full px-8 py-4 md:col-span-2 md:px-2">
            <label for="original-text" class="mb-2 block text-3xl font-bold">Original</label>
            <textarea
              id="original-text"
              placeholder="Enter Traditional Chinese here..."
              v-model="userInput"
              class="custom-scroll h-[40vh] w-[90%] resize-none overflow-auto rounded-lg border-2 border-gray-300 p-2 text-xl shadow-md md:h-[20vh] md:w-full"
            ></textarea>
          </div>
          <div class="w-full px-8 py-4 md:col-span-2 md:px-2">
            <label for="result-text" class="mb-2 block text-3xl font-bold">Corrected</label>
            <div id="result-text" class="custom-scroll h-[40vh] w-[90%] resize-none overflow-auto whitespace-pre-line rounded-lg border-2 border-gray-300 p-2 text-left text-xl shadow-md md:h-[20vh] md:w-full"></div>
          </div>
        </section>
        <section class="mx-8 flex gap-4 md:flex-col md:items-center">
          <button class="default-btn btn-green w-[150px]" @click="examine" aria-label="Check">
            <CheckCircleOutlined />
            Examine
          </button>
          <button class="default-btn btn-red w-[150px]" @click="reset" aria-label="Refresh">
            <ClearOutlined />
            Reset
          </button>
        </section>
      </div>
    </base-card>
  </div>
</template>
