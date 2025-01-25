<script setup>
import { ref, onMounted } from 'vue'
import BaseTextInput from '@/src/components/BaseTextInput.vue'
import { SearchOutlined, PlusSquareOutlined } from '@ant-design/icons-vue'

const searchInfo = ref({
  keyword: ''
})

onMounted(() => {
  const searchParams = new URLSearchParams(window.location.search)
  searchInfo.value.keyword = searchParams.get('keyword')
})
</script>

<template>
  <div class="mb-4 flex justify-between">
    <form
      action="/customs"
      accept-charset="UTF-8"
      method="get"
      class="flex gap-2"
    >
      <BaseTextInput
        name="keyword"
        v-model="searchInfo.keyword"
      ></BaseTextInput>
      <button
        type="submit"
        class="btn text-lg"
      >
        <SearchOutlined />
        Search
      </button>
    </form>
    <a href="/customs/new" class="btn text-lg">
      <plus-square-outlined />
      Add New Words
    </a>
  </div>
</template>
