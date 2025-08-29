import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app.processing import ProcessPartA
import unittest

class TestProcessPartA(unittest.TestCase):
    def setUp(self):
        """
        Set up the test environment with a ProcessPartA instance.
        """
        self.processor = ProcessPartA()
        # Simulate data to run test
        self.processor.data = {
            "samples": [
                {"Au": 2.5},
                {"Au": 3.0},
                {"Au": 4.5}
            ]
        }

    def test_avg_aud_grade_success(self):
        """
        Test average Au grade calculation with sample data.
        """
        expected_average = round((2.5 + 3.0 + 4.5) / 3, 3)  # = 3.333
        result = self.processor.avg_aud_grade()
        self.assertEqual(result, expected_average, f"Expected {expected_average}, but got {result}")

    def test_avg_aud_grade_fail(self):
        """
        Test case deliberately fails: compare wrong expected value.
        """
        wrong_expected = 4.0  
        result = self.processor.avg_aud_grade()
        self.assertEqual(result, wrong_expected)

if __name__ == "__main__":
    unittest.main()
