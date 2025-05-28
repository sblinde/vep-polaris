#!/bin/bash

# Run this test from the root of the vep-polaris repo
# Example: ./tests/test-plugin-inspect.sh

set -euo pipefail

# Colors for pass/fail messages
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "\n🔬 Running tests for plugin-inspect..."

# Create a temporary plugin test directory
TEST_DIR=$(mktemp -d)
trap 'rm -rf "$TEST_DIR"' EXIT

# Create test plugin files
echo -e "# Comment line\n1\t12345\tA\tT" > "$TEST_DIR/plain.tsv"
echo -e "# Comment line\nchr1\t12345\tG\tC" > "$TEST_DIR/chr.tsv"
echo -e "# Only comments\n# Still a comment" > "$TEST_DIR/comments_only.tsv"
gzip -c "$TEST_DIR/plain.tsv" > "$TEST_DIR/plain.tsv.gz"
gzip -c "$TEST_DIR/comments_only.tsv" > "$TEST_DIR/comments_only.tsv.gz"

# Run the plugin-inspect tool
OUTPUT=$(bin/plugin-inspect --dir "$TEST_DIR" --no-color)

# Simple assertions
assert_contains() {
  if echo "$OUTPUT" | grep -q "$1"; then
    echo -e "${GREEN}✔ PASS:${RESET} $2"
  else
    echo -e "${RED}✘ FAIL:${RESET} $2"
    echo -e "Expected output to contain: $1"
    exit 1
  fi
}

assert_contains "plain.tsv" "Plain numeric chromosome format recognized"
assert_contains "chr.tsv" "chrN format recognized"
assert_contains "comments_only.tsv" "Warning for comment-only file shown"
assert_contains "plain.tsv.gz" "Gzipped file processed correctly"
assert_contains "comments_only.tsv.gz" "Empty gzipped file handled correctly"

echo -e "\n✅ All plugin-inspect tests passed.\n"
