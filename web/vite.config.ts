import {defineConfig} from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
    base: './',
    plugins: [react()],
    publicDir: '../out/pages/',
    build: {
        outDir: 'dist',
    },
    server: {
        host: '0.0.0.0'
    }
})
