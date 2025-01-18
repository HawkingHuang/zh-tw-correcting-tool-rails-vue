import globals from 'globals'
import pluginJs from '@eslint/js'
import pluginVue from 'eslint-plugin-vue'
import standard from 'eslint-config-standard'
import pluginN from 'eslint-plugin-n'
import pluginPromise from 'eslint-plugin-promise'
import pluginImport from 'eslint-plugin-import'
import pluginTailwindcss from 'eslint-plugin-tailwindcss'

export default [
  { files: ['**/*.{js,mjs,cjs,vue}'] },
  {
    languageOptions: {
      globals: {
        ...globals.browser,
        $: 'readonly',
        Turbo: 'readonly',
        I18n: 'readonly',
        i18n_locale: 'readonly',
        i18n_translations: 'readonly'
      }
    }
  },
  pluginJs.configs.recommended,
  ...pluginVue.configs['flat/essential'],
  ...pluginTailwindcss.configs['flat/recommended'],
  {
    plugins: {
      n: pluginN,
      import: pluginImport,
      promise: pluginPromise
    },
    rules: {
      ...standard.rules,
      'import/first': 'off',
      'tailwindcss/no-custom-classname': 'off'
    }
  }
]
