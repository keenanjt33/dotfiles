#!/bin/bash

echo "Generating the lists of explicitly installed packages in ~/.packages"

pacman -Qe > ~/.packages/pacman_packages || echo "pacman failed"
npm list -g --depth=0 > ~/.packages/npm_packages || echo "npm failed"

exit 0
