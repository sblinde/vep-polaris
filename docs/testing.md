# 🧪 Testing VEP Polaris

This project includes test scripts to verify that each tool behaves as expected. Tests are written in portable Bash and use only standard Unix utilities.

---

## 🔧 Requirements

-   Bash (4.x or higher)
-   Core Unix utilities: `grep`, `gzip`, `head`, `mkdir`, `rm`, `echo`, etc.
-   Optional: Node.js (for `npm run test` command more easily)

---

## 🚀 Run All Tests

If you've already installed the toolkit:

```bash
npm test
```

This runs the `run-tests.sh` script, which locates and executes all test scripts in `test/`.

Alternatively, run it manually:

```bash
chmod +x run-tests.sh # needs to be run initially
./run-tests.sh
```

This script will:

-   Find all test scripts in the `test/` directory (with filenames like `test-*.sh`)
-   Run each one
-   Exit with an error if any test fails

---

## 🧪 Run an Individual Test

To run a single test directly:

```bash
bash test/test-plugin-inspect.sh
```

Useful when debugging or developing a specific tool.

---

## 🛠 Adding a New Test

To add a new test script:

1. Name it `test/test-<tool>.sh`
2. Make it executable:

    ```bash
    chmod +x test/test-yourtool.sh
    ```

3. It will automatically be picked up by `./run-tests.sh`

---

## ✅ Expected Output

If all tests pass, you'll see something like:

```
🔬 Running all VEP Polaris tests...
➡️  Running: test/test-plugin-inspect.sh
✔ PASS: Plain numeric chromosome format recognized
✔ PASS: chrN format recognized
✔ PASS: Warning for comment-only file shown

✅ All tests passed!
```

If a test fails, it will print a clear failure message and exit:

```
✘ FAIL: Expected output to contain: plain.tsv
```

---

## 🤖 Continuous Integration (Optional)

To include this in GitHub Actions or another CI tool, add a step to your workflow:

```yaml
- name: Run VEP Polaris tests
  run: ./run-tests.sh
```

---

For more information about individual tools, see the [documentation index](index.md).

```bash
vep-polaris <tool> --help
```
