xsign() {
  # Check if a file or directory was provided
  if [ -z "$1" ]; then
    echo "Usage: xSign <path_to_app_or_framework>"
    return 1
  fi

  # Resolve the provided path
  TARGET_PATH=$(realpath "$1")

  # Verify the path exists
  if [ ! -e "$TARGET_PATH" ]; then
    echo "Error: Path does not exist: $TARGET_PATH"
    return 1
  fi

  # Determine if it's a valid `.app` or Framework
  if [[ "$TARGET_PATH" == *.app ]] || [[ "$TARGET_PATH" == *.framework ]]; then
    echo "Signing: $TARGET_PATH"

    # Perform signing
    codesign --force --deep --sign - "$TARGET_PATH"

    # Verify signing
    if codesign --verify --deep --strict "$TARGET_PATH"; then
      echo "Successfully signed: $TARGET_PATH"
      return 0
    else
      echo "Error: Signing verification failed for: $TARGET_PATH"
      return 1
    fi
  else
    echo "Error: Target is not a valid .app or .framework: $TARGET_PATH"
    return 1
  fi
}