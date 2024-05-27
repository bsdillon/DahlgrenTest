def update_analysis(file_name, key, results_html):
    """
    Update the analysis with promised data by append a line to a test report with the analysis results

    :param file_name: The path to the test report.
    :param key: The promise key
    :param results_html: the analysis results as one line of HTML
    """
    # Open the file in append mode
    with open(file_name, 'a') as file:

        # Write the line to the file
        file.write(f"promises['{key}']['Analysis'] = '{results_html}';\n")