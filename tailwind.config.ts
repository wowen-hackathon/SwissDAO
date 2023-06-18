import { type Config } from "tailwindcss";

export default {
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    colors: {
      white: '#e4e7e9',
      black: '#1a1c23',
      red: '#c23d2b',
      blue: '#5b75a1',
      transparent: 'transparent',
      gray: {

        50:
        "#f9fafb",
        100:
        "#f3f4f6",
        200:
        "#e5e7eb",
        300:
        "#d1d5db",
        400:
        "#9ca3af",
        500:
        "#6b7280",
        600:
        "#4b5563",
        700:
        "#374151",
        800:
        "#1f2937",
        900:
        "#111827",
        950:
        "#030712",
    }

     

    },
    extend: {},
  },
  plugins: [],
} satisfies Config;
