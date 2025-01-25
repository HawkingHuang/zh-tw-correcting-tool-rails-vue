<script setup>
import { ref, toRefs, onMounted } from 'vue'
import BaseCard from '@/src/components/BaseCard.vue'
import BaseSelect from '@/src/components/BaseSelect.vue'
import { SearchOutlined } from '@ant-design/icons-vue'

const searchInfo = ref({
  category: ''
})

const props = defineProps({
  libraries: {
    type: Array
  }
})

const { libraries } = toRefs(props)

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

onMounted(() => {
  const searchParams = new URLSearchParams(window.location.search)
  searchInfo.value.category = searchParams.get('category')

  if (!searchInfo.value.category) {
    searchInfo.value.category = 'bpmf1'
  }
})
</script>

<template>
  <div class="">
    <base-card>
      <div>
        <div class="mb-4 flex justify-between">
          <form
            action="/libraries"
            accept-charset="UTF-8"
            method="get"
            class="flex gap-2"
          >
            <BaseSelect
              :name="'category'"
              :optionList="categoryList"
              :optionsSelected="searchInfo.category"
              @select="searchInfo.category = $event"
            />
            <button
              type="submit"
              class="default-btn btn-gray"
            >
              <SearchOutlined />
              Search
            </button>
          </form>
        </div>
        <div class="grid grid-cols-4 gap-4 md:grid-cols-2">
          <div v-for="(word, index) in libraries" :key="index" class="rounded border border-gray-100 bg-gray-100">
            <div class="flex justify-center gap-1">
              <div class="py-2 text-lg text-green-500">{{ word.correct_word }}</div>
              <div class="py-2 text-lg text-red-500">{{ word.incorrect_word }}</div>
            </div>
          </div>
        </div>
      </div>
    </base-card>
  </div>
</template>
