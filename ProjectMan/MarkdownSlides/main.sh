#!/bin/bash

# 1. Clear the master file if it already exists
>master_slides.md

# 2. Use 'ls -v' for natural numerical sorting (1, 2, 10, 11...)
# 3. Use 'while read' to handle filenames with spaces correctly
ls -v "Chapter"*.md | while read -r f; do
  echo "Processing: $f"
  echo -e "\n\n# SOURCE: $f\n" >>master_slides.md
  cat "$f" >>master_slides.md
done

echo "Done! All files merged into master_slides.md"
