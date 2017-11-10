#!/bin/bash
ps aux | grep 'bash main.sh' | grep -v grep | awk '{print $2}' | xargs -I {} kill {}
