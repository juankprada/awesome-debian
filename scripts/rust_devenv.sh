#!/usr/bin/env bash

sudo apt remove rustc

exec curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
