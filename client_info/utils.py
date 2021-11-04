"""Utils.."""

import logging
import yaml

log = logging.getLogger(__name__)

# Will end-up being a method of some data storage class.
def load_yaml_date(filename):
    log.info(f'Import data from {filename}.')
    with open(filename) as f:
        data = yaml.safe_load(f)

    return data
