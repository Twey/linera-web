#!/usr/bin/env bash

set -e

WASM_BINDGEN_VERSION=$(wasm-bindgen --version)
WASM_BINDGEN_VERSION=${WASM_BINDGEN_VERSION##* }
cargo update --package wasm-bindgen --precise "$WASM_BINDGEN_VERSION"

cargo build --lib --target wasm32-unknown-unknown

wasm-bindgen target/wasm32-unknown-unknown/debug/linera_web.wasm --out-dir pkg --typescript --target web --split-linked-modules
