<script setup>
import BaseTextInput from '@/src/components/BaseTextInput.vue'
</script>

<template>
  <div>
    <h2 class="text-center text-3xl font-bold">歡迎使用</h2>
    <form action="/login" method="post">
      <div class="px-4">
        <div class="mb-4 w-full">
          <BaseTextInput :label="'帳號'" :name="'username'" />
        </div>
        <div class="mb-8 w-full">
          <BaseTextInput
            :label="'密碼'"
            :type="'password'"
            :name="'password'"
          />
        </div>
        <div class="flex items-center justify-between gap-2">
          <button
            type="submit"
            class="w-full rounded bg-green-400 p-3 text-lg font-bold text-white"
          >
            登入
          </button>
          <a
            href="/signup"
            class="w-full rounded bg-yellow-400 p-3 text-center text-lg font-bold text-white"
          >
            註冊
          </a>
        </div>
      </div>
    </form>
  </div>
</template>
