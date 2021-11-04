PYTHON=python3
VENV_NAME=.venv
PYLINT=pylint --rcfile .pylintrc
HTML_DIR=docs/sphinx/build/html
PACKAGE_NAME=client_info

all:
	@echo "Be wise, check available targets ..."

.PHONY: setup-venv
setup-venv:
	${PYTHON} -m venv ${VENV_NAME} && \
	. ${VENV_NAME}/bin/activate && \
	pip install --upgrade pip && \
	pip install -r .requirements.txt

.PHONY: lint
lint:
	-@$(PYLINT) ${PACKAGE_NAME} > .pylint_report.json || exit 0
	-@pylint_report.py .pylint_report.json --html-file .pylint_report.html

	mkdir -p $(HTML_DIR)
	rm -rf $(HTML_DIR)/.pylint_report.html
	mv -f .pylint_report.html $(HTML_DIR)

.PHONY: docs
docs: lint test
	cd docs/sphinx && make html

.PHONY: test
test:
	py.test \
	--report-log=.utest_reports/utest.log \
	--html=.utest_reports/utest_report.html \
	--cov=${PACKAGE_NAME} --cov-config=.coveragerc --cov-report html \
	-v ${PACKAGE_NAME}/utest || exit 0

	mkdir -p $(HTML_DIR)
	rm -rf $(HTML_DIR)/.htmlcov
	mv -f .htmlcov $(HTML_DIR)
	rm -rf $(HTML_DIR)/.utest_reports
	mv -f .utest_reports $(HTML_DIR)

.PHONY: clean
clean:
	cd ${PACKAGE_NAME}/utest/data && make clean
