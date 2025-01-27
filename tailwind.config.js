import daisyui from 'daisyui'

export default {
  mode: 'jit',
  content: ['./app/**/*.html*', './app/**/*.vue'],
  important: true,
  theme: {
    extend: {
      screens: {
        xxl: '1920px',
        xl: {
          max: '1439px'
        },
        lg: {
          max: '1279px'
        },
        md: {
          max: '1023px'
        },
        sm: {
          max: '767px'
        }
      },
      colors: {
        main: '#0e3884',
        secondary: '#50bfa6'
      }
    }
  },
  plugins: [daisyui],
  daisyui: {
    styled: true,
    themes: true,
    base: true,
    utils: true,
    logs: true,
    rtl: false,
    prefix: '',
    darkTheme: false
  }
}
