#!/bin/zsh

setopt extended_glob  # Enable advanced pattern matching

for file in *[bB].jpg; do
    # Extract base name (handles case insensitivity and line endings)
    base_name="${file:r}"          # Remove extension
    base_name="${base_name%[bB]}"  # Remove trailing B/b

    original_file="${base_name}.jpg"

    if [[ -f "$original_file" ]]; then
        new_name="${base_name}A.jpg"
        # Check for conflicts before renaming
        if [[ ! -f "$new_name" ]]; then
            mv -n "$original_file" "$new_name" && echo "✅ Renamed: $original_file → $new_name"
        else
            echo "⚠️  Skipped: $new_name already exists (no overwrite)"
        fi
    fi
done


#chmod +x rename_images.zsh
#./rename.zsh

