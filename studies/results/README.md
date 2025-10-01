# Results

This directory contains measurement results, data, and analysis from experiments.

## Organization

Results should be organized by experiment or study:

```
experiment-name/
├── raw-data/
├── processed-data/
├── analysis/
└── figures/
```

## Data Management

- Store raw data in a separate subdirectory
- Include metadata (timestamps, versions, parameters)
- Document data format and structure
- Keep analysis code with results for reproducibility

## Note

Consider using `.gitignore` patterns for large data files and use external storage or Git LFS if needed.
