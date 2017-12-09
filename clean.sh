#!/bin/bash
tmp="../.hash-mapping/"
mkdir -p "$tmp"
git ls-files | xargs -I {} mv {} "$tmp"
mv .git "$tmp"
cd ..
mv hash-mapping hash-mapping.del
mv .hash-mapping hash-mapping
rm -rf hash-mapping.del
