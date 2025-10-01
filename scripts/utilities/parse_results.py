#!/usr/bin/env python3
"""
Results Parser Utility

This utility script parses and aggregates measurement results from experiments.
It can process multiple result files and generate summary statistics.
"""

import json
import argparse
import os
from pathlib import Path
from statistics import mean, stdev


def load_results(directory):
    """
    Load all JSON result files from a directory.
    
    Args:
        directory: Path to directory containing result files
    
    Returns:
        list: List of result dictionaries
    """
    results = []
    result_dir = Path(directory)
    
    if not result_dir.exists():
        print(f"Error: Directory {directory} does not exist")
        return results
    
    for file_path in result_dir.glob('*.json'):
        try:
            with open(file_path, 'r') as f:
                data = json.load(f)
                results.append(data)
        except Exception as e:
            print(f"Warning: Could not parse {file_path}: {e}")
    
    return results


def calculate_statistics(results, metric_key):
    """
    Calculate statistics for a specific metric.
    
    Args:
        results: List of result dictionaries
        metric_key: Key of the metric to analyze
    
    Returns:
        dict: Statistics including mean, min, max, stdev
    """
    values = []
    for result in results:
        if metric_key in result:
            values.append(result[metric_key])
    
    if not values:
        return None
    
    stats = {
        'count': len(values),
        'mean': mean(values),
        'min': min(values),
        'max': max(values),
    }
    
    if len(values) > 1:
        stats['stdev'] = stdev(values)
    
    return stats


def main():
    parser = argparse.ArgumentParser(
        description='Parse and aggregate measurement results'
    )
    parser.add_argument(
        '--directory',
        required=True,
        help='Directory containing result files'
    )
    parser.add_argument(
        '--metric',
        default='startup_time_seconds',
        help='Metric key to analyze'
    )
    parser.add_argument(
        '--output',
        help='Output file for summary (JSON format)'
    )
    
    args = parser.parse_args()
    
    results = load_results(args.directory)
    
    if not results:
        print("No results found to process")
        return
    
    print(f"Loaded {len(results)} result files")
    
    stats = calculate_statistics(results, args.metric)
    
    if stats:
        print(f"\nStatistics for '{args.metric}':")
        print(f"  Count: {stats['count']}")
        print(f"  Mean:  {stats['mean']:.4f}")
        print(f"  Min:   {stats['min']:.4f}")
        print(f"  Max:   {stats['max']:.4f}")
        if 'stdev' in stats:
            print(f"  StDev: {stats['stdev']:.4f}")
        
        if args.output:
            summary = {
                'metric': args.metric,
                'statistics': stats,
                'total_results': len(results)
            }
            with open(args.output, 'w') as f:
                json.dump(summary, f, indent=2)
            print(f"\nSummary saved to {args.output}")
    else:
        print(f"No data found for metric '{args.metric}'")


if __name__ == '__main__':
    main()
