from cmath import isfinite
import unittest
import time

class TestSimpleMath(unittest.TestCase):

    def test_sum(self):
        a = 2 + 2
        self.assertEqual(a, 4)

    def test_isfinite(self):
        b=4
        self.assertTrue(b,isfinite)

if __name__ == '__main__':
    unittest.main()
    