<script setup>
import { toRefs } from 'vue'

const props = defineProps({
  label: {
    type: String
  },
  type: {
    type: String,
    default: 'text'
  },
  name: {
    type: String
  },
  modelValue: {
    type: [String, Number]
  },
  required: {
    type: Boolean
  },
  validate: {
    type: Boolean
  },
  validateText: {
    type: String
  },
  maxlength: {
    type: Number,
    default: null
  }
})

const { label, type, name, modelValue, required, validate, validateText } =
  toRefs(props)
</script>
<template>
  <label>
    <p v-if="label" class="flex items-baseline gap-1 py-1 text-lg font-bold">
      <span>{{ label }}</span>
      <span v-if="required" class="text-sm font-light text-red-400">*</span>
    </p>
    <div>
      <input
        :type="type"
        :name="name"
        :maxlength="maxlength"
        :value="modelValue === 'null' ? null : modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        @keydown.enter.prevent
        class="input w-full border border-gray-300 text-lg"
        :class="{ 'border-2 border-red-400': validate }"
        :required="required"
        autocomplete="off"
        v-bind="$attrs"
      />
      <p v-if="validate" class="mb-0 mt-3 text-sm text-red-400">
        {{ validateText }}
      </p>
    </div>
  </label>
</template>
<style lang="css" scoped>
input[type="text"][disabled] {
  color: #212529;
}
</style>
