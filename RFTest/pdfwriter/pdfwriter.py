from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.pagesizes import letter, landscape
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Image, Paragraph, Spacer, PageBreak
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors
from datetime import datetime, timedelta
from PIL import Image as PIL_Image
import argparse
import re
import json

#------------------------------------------#
#               PDF Creation               #
#------------------------------------------#
status_map = {"Screenshot":"./camera_icon.png",
              "PASS":"./pass_icon.png",
              "FAIL":"./fail_icon.png",
              "Data":"./data_icon.png",
              "Promise":"./promise_icon.png",
              }

def format_time_string(time_object):
    # Convert total_time to hours, minutes, seconds, and microseconds
    hours = time_object.seconds // 3600
    minutes = (time_object.seconds % 3600) // 60
    seconds = time_object.seconds % 60
    microseconds = int(time_object.microseconds/10000)

    # Format the time string
    time_string = "{:02}:{:02}:{:02}.{:02}".format(hours, minutes, seconds, microseconds)

    return time_string

def break_text(text, max_length=50):
    words = text.split()
    answer = ""
    current_line = ""
    for tmp in words:
        word = tmp
        # If adding the next word exceeds the max length, start a new line
        if len(current_line) + len(word) + 1 > max_length:
            if len(word) > max_length:
                #the new word is the problem
                while len(word) < max_length/2:
                    part = max_length - len(current_line)
                    answer += current_line+" "+word[:part]+"\n"
                    word = word[part:]
                    current_line = ""
                    word = word[part:]
            else:
                answer += current_line+"\n"
                current_line = ""

        # Add the word to the current line
        if current_line:
            current_line += " "
        current_line += word

    # Add the last line
    if current_line:
        answer += current_line

    return answer
    
def create_pdf(output_file, test_data):
    # Create a PDF document
    doc = SimpleDocTemplate(output_file, pagesize=landscape(letter))
    date_time_format = "%Y-%m-%d %H:%M:%S.%f"
    time_format = "%H:%M:%S.%f"
    styles = getSampleStyleSheet()
    table_style = TableStyle([('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                        ('TOPPADDING', (0, 0), (-1, 0), 12),
                        ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                        ('BACKGROUND', (0, 0), (-1, 0), colors.lightgrey),
                        ('GRID', (0, 0), (-1, -1), 1, colors.black),
                        ('TEXTCOLOR', (0, 0), (-1, -1), colors.black),
                        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),                        
                        ('FONTNAME', (0, 1), (-1, -1), 'Helvetica')])
    hyperlink_style = ParagraphStyle(
        "Hyperlink",
        fontName="Helvetica",
        fontSize=12,
        textColor=colors.blue,
        underlineColor=colors.blue,
        spaceBefore=5,
        spaceAfter=5)
    anchor_style = ParagraphStyle(
        "Anchor",
        fontName="Helvetica",
        fontSize=12,
        textColor=colors.black,
        spaceBefore=5,
        spaceAfter=5)

    main_elements = []
    main_elements.append(Paragraph("Robot Framework Test Report", styles["Heading1"]))

    p1_boiler = ""
    with open("page1_boilerplate.txt", 'r') as f:
        p1_boiler = f.read()
    main_elements.append(Paragraph(p1_boiler, styles["Normal"]))
    main_elements.append(Spacer(1,12))
    main_elements.append(Paragraph("Test Cases", styles["Heading2"]))

    elements = []

    # Add test data to table data
    main_table_data = []
    main_row_styles = []
    main_table_data.append(["Test Name", "Report", "Steps"])
    test_count = 1
    largest_test_name = "Test Name"
    for test_name in test_data:
        parts = test_name.split("~")
        if len(parts[0])>len(largest_test_name):
            largest_test_name = parts[0]

        # Add the link in the main report
        main_current_row_data = [parts[0],Paragraph(f"<a href='#TEST{test_count}'>LINK</a>", hyperlink_style)]
        row_steps = ""
        if test_count%2 == 0:
            main_row_styles.append(TableStyle(('BACKGROUND', (0, test_count), (-1, test_count), colors.white)))
        else:
            main_row_styles.append(TableStyle(('BACKGROUND', (0, test_count), (-1, test_count), colors.lightcyan)))

        step_count=0

        # Add the anchor and title
        elements.append(Paragraph(f"<a name='TEST{test_count}'></a>", anchor_style))
        elements.append(Paragraph(parts[0], styles["Heading2"]))
        elements.append(Paragraph(parts[1], styles["Heading3"]))
  
        past_time = timedelta()
        time_object = datetime.strptime(parts[1], date_time_format)
        past_time += timedelta(hours=time_object.hour, 
                            minutes=time_object.minute, 
                            seconds=time_object.second, 
                            microseconds=time_object.microsecond)

        table_data = []
        row_styles = []
        table_data.append(["Step", "Time", "Status", "Details"])

        test = test_data[test_name]
        row_count = 1
        largest_step_value = "Step"
        for step_data in test:
            case_value = step_data.get("Case", "")
            step_value = step_data.get("Step", "")
            time_value = step_data.get("Time", "")
            status_value = step_data.get("Status", "")
            detail_value = step_data.get("Details", "")

            if case_value == "&&":
                status_img = status_map[status_value]
                row_steps +=f"<img src='{status_img}' width='10' height='10'></img>"
                if status_value == "PASS":
                    row_styles.append(TableStyle([('BACKGROUND', (0, row_count), (-1, row_count), colors.lime),
                                                  ('SPAN', (0, row_count), (-1, row_count))]))
                else:
                    row_styles.append(TableStyle([('BACKGROUND', (0, row_count), (-1, row_count), colors.red),
                                                ('SPAN', (0, row_count), (-1, row_count))]))
                table_data.append([f"{status_value} *** {status_value} *** FUNCTIONAL GROUP: {step_value} *** {status_value} *** {status_value}\n{detail_value}"])
                step_count += 1

            elif case_value==step_value and case_value=="--":
                row_styles.append(TableStyle([('BACKGROUND', (0, row_count), (-1, row_count), colors.navy),
                                              ('SPAN', (0, row_count), (-1, row_count))]))
                table_data.append([""])
            elif case_value==step_value and case_value=="**":
                row_styles.append(TableStyle([('BACKGROUND', (0, row_count), (-1, row_count), colors.aquamarine),
                                              ('SPAN', (0, row_count), (-1, row_count))]))
                table_data.append([""])
            elif status_value=="Action":
                row_styles.append(TableStyle([('BACKGROUND', (0, row_count), (-1, row_count), colors.yellow),
                                              ('SPAN', (0, row_count), (-1, row_count))]))
                table_data.append([f"Action: {step_value}"])
            elif case_value==step_value and case_value=="==":
                row_styles.append(TableStyle([('BACKGROUND', (0, row_count), (-1, row_count), colors.palegreen),
                                              ('SPAN', (0, row_count), (-1, row_count))]))
                table_data.append([f"FUNCTIONAL GROUP: {detail_value}"])
            else:
                # a "Normal" row
                if len(step_value) > len(largest_step_value):
                    largest_step_value = step_value
                
                status_img = status_map[status_value]
                step_value = break_text(step_value, 40)
                
                time_object = datetime.strptime(time_value, time_format)
                past_time += timedelta(hours=time_object.hour, 
                                    minutes=time_object.minute, 
                                    seconds=time_object.second, 
                                    microseconds=time_object.microsecond)
                time_value = format_time_string(past_time)

                if status_value=="Screenshot":
                    image = PIL_Image.open(detail_value)
                    width, height = image.size
                    if height > 100:
                        width = int(width * (100.0/height))
                        height = 100
                    elif width > 100:
                        width = 100
                        height = int(height * (100.0/width))
                        
                    detail_value = Image(detail_value, width=width, height=height)
                else:
                    detail_value = break_text(detail_value)
                
                table_data.append([step_value, 
                                time_value,
                                Image(status_img, width=20, height=20),
                                detail_value])
                if row_count%2 == 0:
                    row_styles.append(TableStyle([('BACKGROUND', (0, row_count), (-1, row_count), colors.white)]))
                else:
                    row_styles.append(TableStyle([('BACKGROUND', (0, row_count), (-1, row_count), colors.lightcyan)]))

            row_count += 1 #continue to track the row

        # Create table object
        col1 = len(largest_step_value)*6
        col2 = 60
        col3 = 40
        table = Table(table_data, colWidths=[col1, col2, col3, None])
        table.setStyle(table_style)
        for style in row_styles:
            table.setStyle(style)
        elements.append(table)
        elements.append(PageBreak())
        
        #complete the line in the main table
        main_current_row_data.append(Paragraph(row_steps))
        main_table_data.append(main_current_row_data)

    # Create main table object
    col1 = len(largest_test_name)*8
    col2 = 48
    main_table = Table(main_table_data, colWidths=[col1, col2, None])
    main_table.setStyle(table_style)
    main_elements.append(main_table)
    main_elements.append(PageBreak())


    # Add table to the PDF document
    all_elements = main_elements + elements
    doc.build(all_elements)

#------------------------------------------#
#             Manage Promsises             #
#------------------------------------------#
def extract_promises_data(data_lines):
    # Define an empty dictionary to store promises data
    promises_data = {}

    # Define the regex pattern to match the key and analysis data
    pattern = r"promises\['(.+?)'\]\['Analysis'\] = '(.+?)';"
    pattern2 = r"promises\['(.+?)'\]={Analysis: '(.+?)'};"

    # Open the file and iterate over each line
    for line in data_lines:
        # Match the regex pattern against the line
        match = re.search(pattern, line)
        match2 = re.search(pattern2, line)
        
        key = None
        analysis_data = None
        # If a match is found, extract the key and analysis data
        if match:
            key = match.group(1)
            analysis_data = match.group(2)
        elif match2:
            key = match2.group(1)
            analysis_data = match2.group(2)

        if key:
            # Store the extracted data in the promises_data dictionary
            promises_data[key] = {"Analysis": analysis_data}

    return promises_data

#------------------------------------------#
#            Managing TestRuns             #
#------------------------------------------#
   
def extract_test_name_and_date(data_lines):
    test_name_date_pairs = []

    # Define a regular expression pattern to match the test name and date
    pattern = r"testRuns\['(.*?)~(.*?)'\]=\[\];"

    # Iterate over each line of data
    for line in data_lines:
        match = re.match(pattern, line)
        if match:
            # Extract the test name and date from the matched groups
            test_name = match.group(1)
            date = match.group(2)
            # Append the test name and date pair to the list
            test_name_date_pairs.append((test_name, date))

    return test_name_date_pairs

def find_lines_for_test(data_lines, test_name):
    matching_lines = []

    # Construct the key format based on the test name and date
    key_format = "testRuns['"+test_name+"'].push({"
    end_format = "}); "

    # Iterate over each line of data
    for line in data_lines:
        # Check if the line contains the key format
        if key_format in line:
            
            # Append the line to the list of matching lines
            tmp = line[len(key_format):-len(end_format)]
            matching_lines.append(tmp)

    return matching_lines

def parse_test_data(all_data, promises):
    # Initialize variables to store data lines
    data_lines = []

    for match in all_data:
        # Split along ',' as delimiters
        substrings = match.split(',')
        
        # Split each substring into key:"value" pairs and recombine everything
        new_substrings = []
        for sub in substrings:
            parts = sub.split(":", 1)
            key = parts[0].strip()
            value = parts[1].strip()[1:-1]
            new_substrings.append(f'"{key}":"{value}"')
            
        modified_line = ', '.join([f'{sub}' for sub in new_substrings])

        final_line = '{' + modified_line + '}'
        final_data = json.loads(final_line)
        if final_data["Status"]=="Promise":
            #this is a promised data and needs to be pulled in.
            promise_key = final_data["Details"]
            final_data["Details"]=promises[promise_key]["Analysis"]
        data_lines.append(final_data)
    return data_lines

#------------------------------------------#
#            Main functionality            #
#------------------------------------------#
def parse_js_file(js_file):
    # Read the contents of the JavaScript file
    with open(js_file, 'r') as f:
        js_content = f.readlines()

    full_json = {}

    promised_data = extract_promises_data(js_content)
    
    name_date_pairs =  extract_test_name_and_date(js_content)
    for test_name, date in name_date_pairs:
        full_test_name = f"{test_name}~{date}"
        print(f"Parsing data for test '{full_test_name}'")
        raw_lines = find_lines_for_test(js_content, full_test_name)
        full_json[full_test_name] = parse_test_data(raw_lines, promised_data)

    return full_json

def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description="Parse test run keys from a JavaScript file.")
    parser.add_argument("js_file", help="Path to the JavaScript file")
    parser.add_argument("output_file", help="Output file name")
    args = parser.parse_args()

    # Parse the JavaScript file
    test_names = parse_js_file(args.js_file)
    
    create_pdf(args.output_file, test_names)

if __name__ == "__main__":
    main()