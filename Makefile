make install:
pip install --upgrade pip &&\
pip install -r requirements.txt

make lint:
pylint --disable=R,C remainder.py

make test:
python -m test -vv --cov=remainder remainder.py