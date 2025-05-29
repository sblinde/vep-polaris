# 🔍 plugin-inspect

**`plugin-inspect`** is a diagnostic tool included in the `vep-polaris` toolkit. It scans VEP plugin data files to check for:

-   Whether files contain usable data (non-comment lines)
-   What chromosome format they use (e.g., `chr1` vs `1`)
-   Whether any files may cause problems with VEP annotation due to format mismatches

---

## 🧠 Why This Tool Exists

Ensembl VEP is strict about chromosome naming. If your input VCF uses `chr1` but a plugin file uses `1`, annotations may silently fail or be skipped. `plugin-inspect` helps detect and prevent these issues.

---

## 🛠️ Usage

```bash
vep-polaris plugin-inspect [--dir /path/to/plugins] [--no-color] [--help]
```

### Options

| Option       | Description                                                       |
| ------------ | ----------------------------------------------------------------- |
| `--dir`      | Directory containing plugin data files (default: `~/vep/Plugins`) |
| `--no-color` | Disables ANSI color codes (useful for logging)                    |
| `--help`     | Shows usage information                                           |

---

## 📄 Example Output

```text
🔍 Scanning plugin data files in: /vep/Plugins
-------------------------------------------------------------
File                                      | Chromosome Format    | Header/First Line
-------------------------------------------------------------
revel_ready.tsv                           | N                    | 1  35142  35142  GA ...
spliceai_scores.masked.snv.hg37.vcf.gz   | chrN                 | >chr1
whole_genome_SNVs.tsv.gz                 | ❓ Unknown            | ⚠️ Empty or comment-only file...
```

---

## 📦 File Types Supported

`plugin-inspect` scans files with the following extensions:

-   `.tsv`, `.txt`, `.dat`, `.gz`

---

## 🧰 Use Cases

-   Before running VEP on a new dataset
-   When adding or updating plugin files
-   During plugin development or debugging
-   As part of a CI pipeline to validate plugin integrity

---

## 🧪 Tests

See the [testing documentation](testing.md) to learn how to run automated test coverage for this tool.
