# Installation guidelines

## Local

1. Create virtual environment, for example on pwsh:
```bash
python -m venv venv
.\venv\Scripts\Activate.ps1
```

2. Install packages from requirements.txt
```bash
pip install -r app_python/requirements.txt
```

3. Run application and go to `localhost:8000`
```bash
uvicorn app_python.main:app --relaod
```

