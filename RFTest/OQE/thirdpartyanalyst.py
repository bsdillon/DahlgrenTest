import sys
from analysisupdate import update_analysis
import time

def main():
    """
    Third Party Analyst Application is an example analysis tool. It accepts input parameters, 
    performs analysis, and updates analysis results in a specified file. This example tool 
    simulates a 5 second delay and then writes the updated results to the data file. Note that
    it makes use of the analysis update module to ensure the JSON format is correct. It also 
    (over)writes a log file to track what occurs during the run.

    Usage: python script_name.py <file_name> <key> <parameters>
    """
    with open("./analystlog.txt", 'w') as file:
        # Write the line to the file
        file.write(f"Starting third party analyst\n")
        
        # Check if the correct number of command line arguments are provided
        if len(sys.argv) != 4:
            print("Usage: python script_name.py <file_name> <key> <parameters>")
            file.write(f"Broken!!!\n")
            sys.exit(1)
        
        file.write(f"Sleeping\n")
        time.sleep(5)
        file.write(f"Awake\n")

        # Get file name and key from command line arguments
        file_name = sys.argv[1]
        key = sys.argv[2]
        parameters = sys.argv[3]
        results = f"This is my analysis: You input {parameters}"
        file.write(f"Writing data\n")

        # Call the add_to_js_file function
        update_analysis(file_name, key, results)
        file.write(f"Done with data update\n")

if __name__ == "__main__":
    main()