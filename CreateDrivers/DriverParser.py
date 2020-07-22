import re  # regex

import os

import CppHeaderParser  # v2.7.4 must be installed

from message_tracker import MessageTracker


# please ensure module parseMessage.py is in same directory


class DriverParser:
    NSPACE_PATTERN = "\S*::"
    # meant to be a constant regex pattern to strip out namespaces
    tracker = MessageTracker()

    @staticmethod
    def find_topics(contained_in):
        """
        For the file passed, create an associated parser.
        Parse for typedefs, strip namespaces, and
        add message to message list and topic to topic list.
        :except CppHeaderParser.CppParseError: Triggers
                when a file cannot be parsed due
                to not being a C++ header file or containing
                C++ conventions CppHeaderParser
                is unable to handle.
        :except RuntimeError: Handles when max recursion depth
                is exceeded due to Python being
                lame/not optimizing tail recursion.
                Ideally CppHeaderParser would not use recursion.
                NB: Avoid recursion in Python if at all possible.
        :param contained_in: Directory containing headers with all
                typedefs which track Messages and Topics
                in the PLABuild environment.
        :return: None
        """
        try:
            cppHeader = CppHeaderParser.CppHeader(contained_in)
        except CppHeaderParser.CppParseError as e:
            print(e)
            print('Ignoring file and continuing!\n')
            return None
        except RuntimeError as e:
            print('Max recursion depth. Printing error!')
            print(e)
            print(contained_in)
            exit('bad touch')
        else:
            for topic, message in cppHeader.typedefs.items():
                DriverParser.tracker.AddMessage(
                    re.sub(DriverParser.NSPACE_PATTERN, '', message),
                    re.sub(DriverParser.NSPACE_PATTERN, '', topic))

    # end find_topics()

    @staticmethod
    def ValidateDrivers(fileList, driver_dir):
        # pull a directory that has all the files in it
        return DriverParser.tracker.ValidateDrivers(fileList, driver_dir)


# end ValidateDrivers()

@staticmethod
def findCandidates(path, file):
    """
    For argument contained_in_file, create a parser
    to search through the file, find all classes,
    and track them and the filepath that contains them in a dictionary.

    :param path: folder containing the header file
    :param file: header file name
    :except CppHeaderParser.CppParseError:
            Triggers when a file cannot be parsed due
            to not being a C++ header file or containing
            C++ conventions CppHeaderParser
            is unable to handle.
    :return: None
    """
    try:
        cppHeader = CppHeaderParser.CppHeader(
            os.path.join(path, file))
        # parsing the file
    except CppHeaderParser.CppParseError as e:
        print('Ignoring file and continuing!\n')
    else:
        if len(cppHeader.classes) == 0:
            # checks the number of classes
            DriverParser.tracker.AddNonCandidate(path, file)
        else:
            for klasse in cppHeader.classes:
                # for each of classes, add targeted search, goes to parse all,
                # checks number of classes, doesn't do anything
                DriverParser.tracker.AddCandidate(
                    re.sub(DriverParser.NSPACE_PATTERN, '', klasse),
                    path, file)


# end find_candidate_classes()

@staticmethod
def ParseAll(driver_dir):
    DriverParser.tracker.CreateAll(driver_dir)
# end ParseAll
