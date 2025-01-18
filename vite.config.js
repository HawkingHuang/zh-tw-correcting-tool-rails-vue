import vue from '@vitejs/plugin-vue'
import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'
import inject from '@rollup/plugin-inject'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"]),
    vue(),
    inject({
      $: 'jquery',
      jQuery: 'jquery'
    })
  ],
  optimizeDeps: {
    include: ['@ant-design/icons-vue']
  },
  build: {
    outDir: 'public/vite',
    assetsDir: 'assets',
    manifest: true,
    rollupOptions: {
      input: 'app/packs/entrypoints/application.js'
    },
    commonjsOptions: { transformMixedEsModules: true }
  },
  css: {
    postcss: {
      plugins: [
        require('tailwindcss'),
        require('autoprefixer'),
      ],
    },
  }  
})
