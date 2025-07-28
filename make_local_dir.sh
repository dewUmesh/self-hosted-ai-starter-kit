

set -a
source .env
set +a

for var in $(grep -o '^[A-Za-z0-9_]*_PATH' .env); do
  dir="${!var}"
  # Replace single backslash with double backslash
  dir="${dir//\\/\\\\}"
  if [ -d "$dir" ]; then
    echo "Exists: $dir"
  else
    echo "Creating directory: $dir"
    mkdir -p "$dir" && echo "Created: $dir" || echo "Failed to create: $dir"
    
  fi
done