<script setup>
import BaseTextInput from '@/src/components/BaseTextInput.vue'
</script>

<template>
  <div>
    <h2 class="text-center text-3xl font-bold">Welcome</h2>
    <form action="/login" method="post">
      <div class="px-4">
        <div class="mb-4 w-full">
          <BaseTextInput :label="'Username'" :name="'username'" />
        </div>
        <div class="mb-8 w-full">
          <BaseTextInput
            :label="'Password'"
            :type="'password'"
            :name="'password'"
          />
        </div>
        <div class="flex items-center justify-between gap-2">
          <button
            type="submit"
            class="w-full rounded bg-green-400 p-3 text-xl font-bold text-white"
          >
            Login
          </button>
          <a
            href="/signup"
            class="w-full rounded bg-yellow-400 p-3 text-center text-xl font-bold text-white"
          >
            Sign Up
          </a>
        </div>
      </div>
    </form>
  </div>
</template>
