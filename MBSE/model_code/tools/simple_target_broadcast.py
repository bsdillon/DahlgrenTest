
import sys
import os
import subprocess
import shutil
import tempfile
import urllib.request
import csv

def download_plantuml_jar():
    """
    Downloads https://netactuate.dl.sourceforge.net/project/plantuml/plantuml.jar
    and saves to a temporary directory. Temporary data persists after
    the program exists, so running twice only needs to download the .jar once.
    This function always returns the path to the .jar file.
    """
    url = 'https://netactuate.dl.sourceforge.net/project/plantuml/plantuml.jar'
    file = os.path.join(tempfile.gettempdir(), 'plantuml.jar')
    if not os.path.exists(file) or os.path.getsize(file) < 100:
      # Download "url" to "file"
      print('Saving plantuml.jar to {}'.format(file))
      urllib.request.urlretrieve(url, file)

    return file

def main(args):
    """
    Driver method which checks that arguments make sense, downloads plantuml, reads
    input .csv, writes output plantuml, and finally invokes plantuml to generate images.
    """
    
    if len(args) < 2:
        print('Usage: python {} /path/to/messages.csv /path/to/output-graph.png'.format(sys.argv[0]))

    messages_csv_path = args[0]
    if not os.path.exists(messages_csv_path):
        raise Exception('messages_csv_path does not exist, please check the path passed as arg1 (got "{}")'.format(messages_csv_path))

    output_graph_path = args[1]

    # Read .csv file and generate plantUML for a sequence diagram: https://plantuml.com/sequence-diagram
    plantuml_txt = os.path.join(tempfile.gettempdir(), 'simple_target_broadcast_plantuml.txt')
    with open(plantuml_txt, 'w') as plantuml_fd:

        plantuml_fd.write('@startuml'+os.linesep)

        with open(messages_csv_path, 'r') as csv_fd:
            csv_reader = csv.DictReader(csv_fd)
            for row in csv_reader:
                origin = row['Origin']
                recipient = row['Recipient']
                message = row['Message']
                
                plantuml_fd.write(
                    '"{origin}" -> "{recipient}": {message}'.format(
                        origin=origin,
                        recipient=recipient,
                        message=message,
                    )
                )
                plantuml_fd.write(os.linesep)

        plantuml_fd.write('@enduml'+os.linesep)

    print('Wrote PlantUML to {}'.format(plantuml_txt))

    # Check that plantuml + dependencies are installed
    if not shutil.which('java'):
        raise Exception('PlantUML needs java to be installed and java was not detected.')

    plantuml_jar = download_plantuml_jar()
    subprocess.run(['java', '-jar', plantuml_jar, plantuml_txt, '-o', output_graph_path])


if __name__ == '__main__':
    main(sys.argv[1:])
