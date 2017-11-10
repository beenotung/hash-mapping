#!/bin/bash
ps aux | grep 'main.sh' | grep -v grep | awk '{print $2}' | xargs -I {} kill {} 2>&1 | grep -v 'No such process' | grep -v 'terminated'
