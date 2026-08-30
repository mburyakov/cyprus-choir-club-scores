import {defineConfig} from 'vite'
import react from '@vitejs/plugin-react'
import yaml from '@rollup/plugin-yaml'

export default defineConfig({
    base: './',
    plugins: [react(), yaml()],
    publicDir: '../out/pages/',
    build: {
        outDir: 'dist',
    },
    server: {
        host: '0.0.0.0'
    }
})
