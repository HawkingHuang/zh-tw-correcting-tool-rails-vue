<script setup>
import { ref } from 'vue'
import { MenuOutlined } from '@ant-design/icons-vue'

const isMenuOpen = ref(false)
const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}

const modules = [
  { name: 'Check', path: '/check', controllerPath: 'check' },
  { name: 'Custom', path: '/customs', controllerPath: 'customs' },
  { name: 'Library', path: '/libraries?category=bpmf1', controllerPath: 'libraries' },
  { name: 'Report', path: '/reports', controllerPath: 'reports' },
  { name: 'About', path: '/about', controllerPath: 'about' }
]
</script>

<template>
  <div id="header" class="navbar relative bg-base-100">
    <!-- 手機版選單 -->
    <div class="hidden md:block">
      <button @click="toggleMenu" type="button" class="default-btn">
        <MenuOutlined />
      </button>
      <div v-if="isMenuOpen" class="absolute left-0 top-full z-[500] grid grid-cols-1 justify-items-center gap-1 rounded bg-white p-4 shadow-xl">
        <a
          v-for="tab in modules"
          :key="tab.name"
          :href="tab.path"
          class="default-btn hover:bg-gray-200"
        >
          {{ tab.name }}
        </a>
        <form method="post" action="/logout">
          <input type="hidden" name="_method" value="delete" />
          <button type="submit" class="default-btn hover:bg-gray-200">Log Out</button>
        </form>
      </div>
    </div>

    <!-- 桌面版選單 -->
    <div class="flex-1 gap-1 md:hidden">
      <a
        v-for="tab in modules"
        :key="tab.name"
        :href="tab.path"
        class="default-btn hover:bg-gray-200"
      >
        {{ tab.name }}
      </a>
      <form method="post" action="/logout">
        <input type="hidden" name="_method" value="delete" />
        <button type="submit" class="default-btn hover:bg-gray-200">Log Out</button>
      </form>
    </div>
  </div>
</template>
