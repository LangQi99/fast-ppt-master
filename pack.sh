#!/usr/bin/env bash
set -euo pipefail

cd skills/fast-ppt-master
zip -r ../../fast-ppt-master.zip . -x '.*'
cd ../..
echo "Packed → fast-ppt-master.zip ($(du -sh fast-ppt-master.zip | cut -f1))"
