#!/bin/bash
set -e

echo "🔬 Running all VEP Polaris tests..."

for test_file in ./test/test-*.sh; do
  echo "➡️  Running: $test_file"
  bash "$test_file"
done

echo "✅ All tests passed!"