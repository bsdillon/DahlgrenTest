"""Wrapper module for class Message Tracker"""
import copy
import os

from Parsers.parseClass import ParseClass
# please ensure module parseMessage.py is in same directory
from dependencyTracker import DependencyTracker


class MessageTracker:
    DriverFileEnd = '_Driver.h'
    configFile = 'Drivers.config'
    mapSeparator = '::'
    elementSeparator = ';'
    fileSeparator = '----------------------------\n'

    def __init__(self):
        """
        Creates lists and lists and more lists...determines
        what information is available to write code.
        Standard init containing all fields to track messages"""
        self.driverList = []
        # a list of PathList objects
        self.candidate_dict = {}
        # a dict containing any-class-names : filepath
        # in all header files in PLA Source code
        self.accepted_dict = {}
        # a dict containing verified-message-class-names : filepath
        self.unique_message_list = []
        # a list of all unique messages-class-names. messages with
        # multiple topics only appear once.
        self.all_message_list = []
        # an ordered list of all messages-class-names. if messages
        # have more than one topic,
        # they appear for each topic.
        self.topic_list = []
        # a list of all topics. this list is correlated by index
        # with the all_message_list
        self.topic_messagedict = {}
        # a mapping of topics : message-class-names. Will be empty
        # until create_dicts() is called
        self.AllHeaderFiles = {}
        self.driverDirectory = ""

    # end __init__

    def AddMessage(self, message, topic):
        # adds a list of different messages and only wants new messsage
        """Adds a message-topic pair to the MessageTracker.
        These items MAY confirm a candidate message class"""
        self.all_message_list.append(message)
        if message not in self.unique_message_list:
            self.unique_message_list.append(message)
        self.topic_list.append(topic)

    # end AddMessage

    def ValidateDrivers(self, fileList, driverPath):
        # checks if the drivers are missing
        """
        Searches for exact correlation of
        expected messages with those found in driver folder
        If found, it loads the details as they were last known.
        :param fileList:
        :return:
        """
        self.driverDirectory = driverPath

        # first determine if you have a file to parse
        if not os.path.exists(MessageTracker.configFile):
            return False

        # Verify that driver files exist
        print('Attempting to validate existing drivers...', )
        for message in self.unique_message_list:
            if not message + self.DriverFileEnd in fileList:
                return False
        print
        'Driver files match with expected messages'

        print
        'Reading driver files...',
        file = open(MessageTracker.configFile, 'r')
        map = file.readline()
        print
        'Done'

        # save the mapping from previous run
        print('Parsing topic-message mapping...', end=" ")
        topicMap = map.split(MessageTracker.elementSeparator)
        count = 0
        for pair in topicMap:
            # the last element is always a newline
            if pair == '\n':
                continue
            count += 1
            # add classes and associates it
            if count % 50 == 0:
                print('.', )
            tm = pair.split(MessageTracker.mapSeparator)
            if not len(tm) == 2:
                print('Error: Two elements not found in ' + pair)
                return False
            if tm[1] not in self.all_message_list:
                print('Unknown message found in configuration file: ' + tm[1])
                exit(-1)
            if tm[0] not in self.topic_list:
                print('Unknown topic found in configuration file: ' + tm[0])
                exit(-1)
        self.topic_messagedict = zip(self.topic_list, self.all_message_list)
        print('Done')

        # Reparse all files
        print('Loading existing drivers...', )
        count = 0
        line = file.readline()
        while not line == MessageTracker.fileSeparator:
            self.driverList.append(ParseClass.FromFile(line))
            count += 1
            if count % 50 == 0:
                print
                '.',
            line = file.readline()
        print('Done')

        print('Loading parsed files...', )
        count = 0
        line = file.readline()
        tuples = line.split(MessageTracker.elementSeparator)
        for t in tuples:
            if t == '\n':
                break
            count += 1
            if count % 20 == 0:
                print('.', )
            parts = t.split(',')
            if not len(parts) == 3:
                continue
            self.AllHeaderFiles[parts[0]] = [parts[1], parts[2]]
        print('Done')
        file.close()
        self.ProcessCodeBase()
        return True

    # end ValidateDrivers

    def AddNonCandidate(self, path, file):
        self.AllHeaderFiles[file] = [path, file]
        # find path to file

    # end AddNonClassFile

    def AddCandidate(self, name, path, file):
        """Adds a Candidate Class to the the MessageTracker.
        Until confirmed this class MAY be a message"""
        if name not in self.candidate_dict.keys():
            self.candidate_dict[name] = [path, file]
            self.AllHeaderFiles[file] = [path, file]

    # end AddCandidate

    def CreateAll(self, driver_dir):

    # knows directory
    """
    This method performs final correlation on the 
    message-topic pairs and candidate classes
    before executing the driver creation
    Precondition: All candidate classes and message-topic 
    pairs have been added
    :param driver_dir: location for all drivers
    :return: None
    """
    self.driverDirectory = driver_dir

    print('{candidate_count} Candidate classes identified\n'.format(
        candidate_count=len(self.candidate_dict.keys())))
    print('{unique_message_count} Unique message classes identified\n'
          .format(unique_message_count=len(self.unique_message_list)))
    print('{topic_count} Topics identified\n'
          .format(topic_count=len(self.topic_list)))

    print('Unifying all lists...', )
    self.topic_messagedict = zip(self.topic_list, self.all_message_list)

    # get separate list of unique messages
    self.unfound_list = copy.deepcopy(self.unique_message_list)

    # align unique messages with candidate classes
    for item in self.unfound_list:
        if item in self.candidate_dict:
            # add matches to the accepted list
            self.accepted_dict[item] = self.candidate_dict[item]

    # remove all accepted classes from unfound list
    for item in self.accepted_dict.keys():
        self.unfound_list.remove(item)
    print('Done\n')

    # Advise user of outcome
    accepted = str(len(self.accepted_dict))
    if self.unfound_list:
        print
        '{unfound_list_count} messages were not found:\n' \
            .format(unfound_list_count=len(self.unfound_list))
        for message in self.unfound_list:
            print(message)
        print('\n\n')
        print('{accepted_dict_count} messages were found:\n' \
              .format(accepted_dict_count=len(self.accepted_dict)))
    else:
        # clear off all unused lists
        del self.unique_message_list
        del self.unfound_list
        print('All {accepted} messages were found.\n' \
              .format(accepted=accepted))

    # Go through all verified header files, create a
    # PathList object for each one, and append
    # each PathList object to the list tracking those objects.
    print('Reading message files...', )
    count = 1
    for key, value in self.accepted_dict.items():
        # value is now a touple of path and filename strings
        p = ParseClass(value[0], value[1], driver_dir,
                       key + self.DriverFileEnd, True)
        self.driverList.append(p)
        count += 1
        if count % 20 == 0:
            print('.', )
    print('Done\n')

    self.ProcessCodeBase()
    self.WriteConfigFile()


# end CreateAll

def WriteConfigFile(self):
    config = open(MessageTracker.configFile, 'w')
    print('Finalizing configuration file...', )
    for topic, message in self.topic_messagedict:
        config.write('{topic}{mapDelim}{message}{elementDelim}'
                     .format(topic=topic,
                             mapDelim=MessageTracker.mapSeparator,
                             message=message,
                             elementDelim=MessageTracker
                             .elementSeparator))

    config.write("\n")
    for pathList in self.driverList:
        config.write(pathList.ToFile())

    config.write(MessageTracker.fileSeparator)

    for f in self.AllHeaderFiles:
        v = self.AllHeaderFiles[f]
        config.write('{f},{v_0},{v_1}{elementDelim}'
                     .format(f=f, v_0=v[0], v_1=v[1],
                             elementDelim=MessageTracker
                             .elementSeparator))
    print('Done\n')
    config.close()


# end WriteConfigFile

def ProcessCodeBase(self):
    dependencies = DependencyTracker(self.driverList,
                                     self.AllHeaderFiles,
                                     self.driverDirectory)

    # write all driver files
    dependencies.WriteFiles(self.driverDirectory)
    dependencies.WriteFactory(self.driverDirectory,
                              sorted(self.topic_messagedict),
                              self.driverList)
# end ParseCodeBase
