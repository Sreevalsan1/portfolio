/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        cyber: {
          bg: '#05070E',
          surface: '#0B1120',
          card: '#0F172A',
          border: 'rgba(56, 189, 248, 0.12)',
          cyan: '#06B6D4',
          blue: '#3B82F6',
          purple: '#8B5CF6',
          violet: '#A855F7',
          emerald: '#10B981',
          text: '#F8FAFC',
          muted: '#94A3B8',
          darkMuted: '#64748B',
        },
        apple: {
          bg: {
            light: '#F8FAFC',
            dark: '#05070E',
          },
          card: {
            light: '#FFFFFF',
            dark: '#0B1120',
          },
          subcard: {
            light: '#F1F5F9',
            dark: '#111827',
          },
          blue: {
            DEFAULT: '#2563EB',
            hover: '#1D4ED8',
            dark: '#38BDF8',
          },
          gray: {
            text: '#64748B',
            darkText: '#94A3B8',
            borderLight: 'rgba(0, 0, 0, 0.08)',
            borderDark: 'rgba(255, 255, 255, 0.08)',
          }
        }
      },
      fontFamily: {
        sans: [
          "Inter",
          "-apple-system",
          "BlinkMacSystemFont",
          "system-ui",
          "sans-serif"
        ],
        mono: [
          "JetBrains Mono",
          "Fira Code",
          "Menlo",
          "Monaco",
          "Courier New",
          "monospace"
        ]
      },
      borderRadius: {
        'squircle-sm': '12px',
        'squircle': '18px',
        'squircle-lg': '24px',
        'squircle-xl': '32px',
      },
      boxShadow: {
        'cyber-glow': '0 0 25px -5px rgba(6, 182, 212, 0.3)',
        'purple-glow': '0 0 25px -5px rgba(139, 92, 246, 0.3)',
        'blue-glow': '0 0 25px -5px rgba(59, 130, 246, 0.3)',
        'glass': '0 8px 32px 0 rgba(0, 0, 0, 0.45)',
      },
      animation: {
        'pulse-slow': 'pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'float': 'float 6s ease-in-out infinite',
      },
      keyframes: {
        float: {
          '0%, 100%': { transform: 'translateY(0px)' },
          '50%': { transform: 'translateY(-10px)' },
        }
      }
    },
  },
  plugins: [],
}
