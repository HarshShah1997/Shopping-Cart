# Shopping Cart  
A simple E-commerce website using Flask
  
## Dependencies 
1. Python3
2. Flask
3. Sqlite

## Pipenv instructions 
1. Install pipenv:
```bash
python3 -m pip install --user pipenv
```

2. Install dependencies:
```bash
pipenv install --dev
```

## How to run 
1. Set up database (or you can reuse the existing database included in the repo):
```bash
pipenv run python database.py
```

2. Run the server:
```bash
pipenv run python main.py
```

3. Enter `http://localhost:5000` in a browser

## Sample User 
Sample credentials present in existing database:

* Username - `sample@example.com`
* Password - `sample`
