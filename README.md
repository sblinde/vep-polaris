# VEP Polaris 🌟

> A lightweight toolkit to inspect, validate, and manage plugin data for [Ensembl Variant Effect Predictor](https://www.ensembl.org/vep) (VEP).

**VEP Polaris** helps you navigate the complex ecosystem of Ensembl VEP plugin data files by ensuring compatibility, correctness, and clarity in your annotation pipeline.

## Why Use VEP Polaris?

-   Prevent silent or breaking VEP annotation errors due to chr1 vs 1 mismatches
-   Test and validate plugin data structure before annotation
-   Identify problematic or empty files in large plugin datasets
-   Prepare and clean up custom plugin inputs

## Tools Included

| Command          | Description                                                          |
| ---------------- | -------------------------------------------------------------------- |
| `plugin-inspect` | Scans plugin files for usable data and chromosome format consistency |

Each command is a self-contained script, callable through the `vep-polaris` dispatcher.

## Installation

```bash
git clone https://github.com/yourusername/vep-polaris.git
cd vep-polaris

# Optionally add to PATH
export PATH="$PWD/bin:$PATH"
```

### 🔧 Quick Install

If you have Node.js installed on your machine:

```bash
npm run install
```

This will:

-   Make all CLI and test scripts executable
-   Optionally symlink vep-polaris to /usr/local/bin
-   Print documentation setup tips

⚠️ If you’re not using Node, you can still run:

```bash
chmod +x install.sh && ./install.sh
```

### 🧪 Run Tests

To validate that tools like `plugin-inspect` work as expected:

If you are using Node, you can run

```bash
npm test
```

or, otherwise:

```bash
./run-tests.sh
```

See [docs/testing.md](docs/testing.md) for more detail.

## Usage

```bash
vep-polaris <command> [options]
```

Example:

```bash
vep-polaris plugin-inspect --dir /vep/Plugins
```

Run any command with `--help` for further details.

```bash
vep-polaris plugin-inspect --help
```

## Project Structure

```
vep-polaris/
├── bin/                  # All subcommands and CLI dispatcher
│   ├── vep-polaris
│   ├── plugin-inspect
│   └── ...
├── docs/                 # Detailed command documentation
├── tests/                # Test scripts for tools
├── README.md
├── LICENSE
└── .gitignore
```

## Working with Documentation

You can preview the `docs/` folder using MKDocs.

```bash
npm run docs:serve     # Preview at http://localhost:8000
```

## Contributing

At this time, this is a small side project owned by me, Sam Blinde as I endeavor in the world of bioinformatics. As this project may grow over time during my learning, I'd welcome the following support:

-   Suggesting a new tool in this repo
-   Submit a bug fix if you come across one
-   Improving documentation or test coverage

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Acknowledgments ⭐

-   Built with love by Sam Blinde.
-   Inspired by wrestling with VEP plugin formats.
-   Much appreciation to everyone who has contributed to [Ensembl VEP](https://www.ensembl.org/vep) and all of the plugins underneath it, for this little project would not exist without it.
