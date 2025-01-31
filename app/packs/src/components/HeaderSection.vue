<script setup>
import { ref } from 'vue'
import { MenuOutlined } from '@ant-design/icons-vue'
import { ShieldCheckIcon, PlusCircleIcon, BookOpenIcon, FlagIcon, InformationCircleIcon, ArrowRightStartOnRectangleIcon } from '@heroicons/vue/24/solid'

const isMenuOpen = ref(false)
const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}

const modules = [
  { name: 'Check', path: '/check', controllerPath: 'check', icon: ShieldCheckIcon },
  { name: 'Custom', path: '/customs', controllerPath: 'customs', icon: PlusCircleIcon },
  { name: 'Library', path: '/libraries?category=bpmf1', controllerPath: 'libraries', icon: BookOpenIcon },
  { name: 'Report', path: '/reports', controllerPath: 'reports', icon: FlagIcon },
  { name: 'About', path: '/about', controllerPath: 'about', icon: InformationCircleIcon }
]
</script>

<template>
  <div id="header" class="navbar relative bg-base-100">
    <!-- 手機版選單 -->
    <div class="hidden md:block">
      <button @click="toggleMenu" type="button" class="default-btn">
        <MenuOutlined />
      </button>
      <div v-if="isMenuOpen" class="absolute left-0 top-full z-[500] grid grid-cols-1 justify-start gap-1 rounded bg-white p-4 shadow-xl">
        <a
          v-for="tab in modules"
          :key="tab.name"
          :href="tab.path"
          class="default-btn flex justify-start hover:bg-gray-200"
        >
          <component :is="tab.icon" v-if="tab.icon" class="size-6" />
          {{ tab.name }}
        </a>
        <form method="post" action="/logout">
          <input type="hidden" name="_method" value="delete" />
          <button type="submit" class="default-btn hover:bg-gray-200">
            <ArrowRightStartOnRectangleIcon class="size-6" />
            Log Out
          </button>
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
        <component :is="tab.icon" v-if="tab.icon" class="size-6" />
        {{ tab.name }}
      </a>
      <form method="post" action="/logout">
        <input type="hidden" name="_method" value="delete" />
        <button type="submit" class="default-btn hover:bg-gray-200">
          <ArrowRightStartOnRectangleIcon class="size-6" />
          Log Out
        </button>
      </form>
    </div>
  </div>
</template>
