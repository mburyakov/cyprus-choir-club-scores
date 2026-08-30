import {defineConfig} from 'vite'
import react from '@vitejs/plugin-react'
import yaml from '@rollup/plugin-yaml'
import {cpSync, mkdirSync, rmSync} from 'node:fs'
import {fileURLToPath} from 'node:url'

const projectRoot = fileURLToPath(new URL('..', import.meta.url))
const publicDir = `${projectRoot}/build/public`
const staticDir = `${publicDir}/static`

rmSync(publicDir, {recursive: true, force: true})
mkdirSync(staticDir, {recursive: true})
cpSync(`${projectRoot}/build/media`, staticDir, {recursive: true})
cpSync(`${projectRoot}/build/logo`, staticDir, {recursive: true})
cpSync(`${projectRoot}/pages/midiplayer`, `${staticDir}/midiplayer`, {recursive: true})

export default defineConfig({
    base: './',
    plugins: [react(), yaml()],
    publicDir,
    build: {
        outDir: 'dist',
    },
    server: {
        host: '0.0.0.0'
    }
})
