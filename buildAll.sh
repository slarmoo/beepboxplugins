#!/usr/bin/env bash
set -e

./buildPlugin.sh -i pluginSource/Corruption.ts -o plugins/corruption.js
./buildPlugin.sh -i pluginSource/Desample.ts -o plugins/desample.js
./buildPlugin.sh -i pluginSource/Sustain.ts -o plugins/sustain.js
./buildPlugin.sh -i pluginSource/ReverbPlus.ts -o plugins/reverbplus.js