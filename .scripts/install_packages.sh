#!/bin/bash
for pkgName in $(cat ~/.packages/pacman_packages

do
  pacman -S --force --noconfirm $pkgName
done
echo "Reinstalled pacman packages."
