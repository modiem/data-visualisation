# ----------------------------------
#         LOCAL SET UP
# ----------------------------------
install_requirements:
	@pip install -r requirements.txt

check_code: 
	@flake8 app.py Packages/*.py

black:
	black app.py Packages/*.py

test:
	@coverage run -m pytest tests/*.py
	@coverage report -m --omit=$(VIRTUAL_ENV)/lib/python*

clean:
	@rm -fr */__pycache__
	@rm -fr */.ipynb_checkpoints
	@rm -fr __init__.py
	@rm -fr build
	@rm -fr dist
	@rm -fr *.dist-info
	@rm -fr *.egg-info
	@rm -fr .ipynb_checkpoints


install:
	@pip install -e . -U 

all: clean install test black check_code

uninstal:
	@python setup.py install --record files.txt
	@cat files.txt | xargs rm -rf
	@rm -f files.txt

