# CI/CD Integration Guide

## How to Run Tests Locally
```bash
pip install -r requirements.txt
pytest test_runner.py
```

## GitHub Actions Integration
Add this to `.github/workflows/python-tests.yml`:
```yaml
name: Python Tests
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.x'
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
      - name: Run tests
        run: |
          pytest test_runner.py
```

## Azure DevOps Integration
Add this to `azure-pipelines.yml`:
```yaml
trigger:
- main
pool:
  vmImage: 'ubuntu-latest'
steps:
- task: UsePythonVersion@0
  inputs:
    versionSpec: '3.x'
- script: |
    pip install -r requirements.txt
    pytest test_runner.py
  displayName: 'Run Python Tests'
```
