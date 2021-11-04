"""Utests."""
import sys
import unittest
import logging
from pathlib import Path

utest_path = Path(__file__).resolve().parent
sys.path.append(str(utest_path / '../..'))

from client_info import utils

class TestClientInfo(unittest.TestCase):
    """Test."""
    data_dir = utest_path / 'data'

    def setUp(self):
        """Define data and setup environment."""
        logging.disable(logging.CRITICAL)  # disable logging at all levels

    def test_todo(self):
        """Test."""
