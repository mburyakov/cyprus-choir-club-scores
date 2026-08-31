FROM mcr.microsoft.com/devcontainers/base:bookworm

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        ca-certificates \
        chromium-headless-shell \
        fluid-soundfont-gs \
        poppler-utils \
        vlc \
        vlc-plugin-fluidsynth \
    && rm -rf /var/lib/apt/lists/*
