import { type Config } from "tailwindcss";

export default {
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    colors: {
      header: '#2B3D00',
      white: '#FFFFFF',
    },
    extend: {},
  },
  plugins: [],
} satisfies Config;
