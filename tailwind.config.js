/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './resources/**/*.blade.php',
    './resources/**/*.js',
    './resources/**/*.vue',
  ],
  theme: {
    extend: {
      fontFamily: {
        serif: ['Playfair Display', 'serif'],
        body: ['Crimson Pro', 'serif'],
      },
      colors: {
        paper: '#fdfaf3',
        ink: '#1f1b16',
        accent: '#8b5e3c',
      },
    },
  },
  plugins: [],
}

