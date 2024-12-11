#!/bin/sh

path=$(pwd)
venvfile="$path/venv/bin/activate"
session_name="betaFarm"

tmux kill-session -t $session_name 2>/dev/null

