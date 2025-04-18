#import processing
from processing import ProcessPartA
import os

if __name__ == "__main__":
    file_name = os.path.join(os.path.dirname(__file__), "TestData.xlsx")
    proc = ProcessPartA()
    proc.retrieve_data(file_name)
    print('Done')
