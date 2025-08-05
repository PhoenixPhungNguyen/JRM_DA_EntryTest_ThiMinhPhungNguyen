#import processing
from processing import ProcessPartA
import os
import logging

if __name__ == "__main__":
    #Config log
    logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")
    #Create file path to file
    file_name = os.path.join(os.path.dirname(__file__), "TestData.xlsx")
    try:
        #Check exists file name
        if not os.path.exists(file_name):
            raise FileNotFoundError(f"File not found: {file_name}")
        proc = ProcessPartA()
        proc.retrieve_data(file_name)
        logging.info("Done.")
    except FileNotFoundError as e:
        logging.error(e)