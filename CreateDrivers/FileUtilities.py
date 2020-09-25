import sys
import re  # regex
import os

from DriverParser import DriverParser


class FileUtilities:
    """
        FileUtilities provides standard methods to read source code
        files and handle them in a uniform way.
    """


dirPattern = r'^(\/[\w^ ]+)+$'
dirRegEx = re.compile(dirPattern)
propDelimiter = ':'


@staticmethod
def ReadDefaults(defaultFile):
    """
    Read the specified file if it exists. Return a properties
    dictionary (empty if the file doesn't exist)
    :param defaultFile:
    :return: dictionary of propertyName:value
    """
    print('Reading program settings...', end=" ")
    properties = {}
    try:
        if os.path.exists(defaultFile):
            file = open(defaultFile, 'r')
            line = file.readline().split(FileUtilities.propDelimiter)
            while len(line) == 2:
                properties[line[0]] = line[1].strip('\n')
                line = file.readline().split(FileUtilities.propDelimiter)
            file.close()
        print('Done\n\n')
    except Exception as ex:
        print('Error in file: ' + ex + '\n')
        return {}
    return properties


# end ReadDefaults

@staticmethod
def WriteDefaults(default_file, defaults):
    """
    Write the default propertyName:value pairs to the specified file
    :param default_file:
    :param defaults:
    :return: None
    """
    print
    'Saving program settings...',
    file = open(default_file, 'w')
    for prop in defaults.keys():
        file.write('{prop}{propDelim}{defaults_prop}'
                   '\n'.format(prop=prop,
                               propDelim=FileUtilities.propDelimiter,
                               defaults_prop=defaults[prop]))
    file.close()
    print
    'Done\n\n'


# end WriteDefaults

@staticmethod
def validate_dir(directory, force_creation):
    """
    Ensure directory is a valid.
    :param directory: a directory
    :exception OSError: Raised if directry is not valid,
    not a directory, or does not exist
    :return: validated directory
    """
    if directory.lower() == 'quit':
        print('Quitting!')
        sys.exit(0)

    if not FileUtilities.dirRegEx.match(directory):
        # this error indicates the string is invalid in its structure
        raise OSError(directory + ' is not a valid linux directory.')

    if not os.path.isdir(directory):
        # the string is valid as a path, but it doesn't exist
        if force_creation:
            os.makedirs(directory)
            print('\n\tDirectory created\n')
        else:
            raise OSError(directory + ' does not exist.')
    else:
        print('\n\tDirectory  validated\n')
    return directory


# end validate_dir()

@staticmethod
def ReadAllFiles(source, topics, driver):
    """
    For each header file contained in h_dir and its subdirectories, pass
    the file's path to find_candidate_classes(). For each header file
    contained in typedef_path and its subdirectories, pass the file's path
    to find_topics().
    :param source: Path containing all source code for PLABuild.
    :param topics: Path containing all headers with relevant
    Message/Topic typedefs.
    :param driver: Destination for all drivers
    :return: None
    """

    print('\nIdentifying topics...', end=" ")
    for root, sub_dir_list, file_list in os.walk(topics, topdown=True):
        for fname in file_list:
            DriverParser.find_topics(os.path.join(root,
                                                  fname))
    print('Done\n')

    if not DriverParser.ValidateDrivers(os.listdir(driver),
                                        driver):
        print('Driver files are incomplete. Reparsing messages')
        count = 1
        print('Identifying candidate Message classes...')
        for root, sub_dir_list, file_list in os.walk(source, topdown=True):
            print('Searching ' + root, end=" ")
            for fname in file_list:
                if fname[-2:] == '.h' and fname[:3] != 'DDS':
                    # All header files are candidates for "message classes"

                    # No DDS files are acceptable
                    # as the contain no original classes

                    DriverParser.findCandidates(root, fname)
                    count += 1
                    if count % 20 == 0:
                        print('.', end=" ")
            print('.')
        print('Done\n')
        DriverParser.ParseAll(driver)
# end initialize_all
