"""
 Forked from version 2017-06-30

 This program is meant to auto-generate C++ header files ("Drivers") from
 material in associated C++ header files ("Messages").

 Dependencies: CppHeaderParser 2.7.4

 Author(s): J. Conklin

 version 2017-08-09

 Developed using Python 2.7.5 on RHEL 7.3
"""

from FileUtilities import FileUtilities
from message_tracker import MessageTracker

# EvilGlobalState:
debug = False  # currently not used, but has the potential to be implemented as a debug flag
settingFile ='settings.prop'
# end EvilGlobalState

# def main():
defaults = FileUtilities.ReadDefaults(settingFile)
default_source_dir = defaults.get('source_directory','/root/workspace/src')
default_topic_dir = defaults.get('topic_directory','/root/workspace/src/TopicMapping')
default_driver_dir = defaults.get('driver_directory','/root/Documents/drivers/')

validated = False
defaultsChanged = False

while not validated:
    prompt = 'Enter directory containing source code (or "quit"):[{default_source_dir}] '.format(default_source_dir = default_source_dir)
    source_dir = raw_input(prompt) or default_source_dir
    try:
        source_dir = FileUtilities.validate_dir(source_dir, False)
        defaultsChanged |= source_dir != default_source_dir
        validated = True
    except OSError as e:
        print(e)
        print('Please try again.')
        continue

validated = False

while not validated:
    # must be a DIRECTORY, not a FILE
    prompt = 'Enter directory containing message/topic definitions (or "quit"):[{default_topic_dir}] '.format(default_topic_dir = default_topic_dir)
    topic_dir = raw_input(prompt) or default_topic_dir
    try:
        topic_dir = FileUtilities.validate_dir(topic_dir, False)
        defaultsChanged |= topic_dir != default_topic_dir
        validated = True
    except OSError as e:
        print(e)
        print('Please try again')
        continue

validated = False

while not validated:
    prompt = 'Enter destination directory for Drivers (or "quit"):[{default_driver_dir}] '.format(default_driver_dir = default_driver_dir)
    driver_dir = raw_input(prompt) or default_driver_dir
    try:
        driver_dir = FileUtilities.validate_dir(driver_dir, True)
        defaultsChanged |= driver_dir != default_driver_dir
        validated = True
    except OSError as e:
        print( e)
        print( 'Please try again.')
        continue

while defaultsChanged:
    ans = raw_input("Values have been updated. Save as defaults? Y/N:[Y]") or 'Y'
    if ans == 'Y':
        default_source_dir = source_dir
        default_topic_dir = topic_dir
        default_driver_dir = driver_dir
        defaults['source_directory'] = default_source_dir
        defaults['topic_directory'] = default_topic_dir
        defaults['driver_directory'] = default_driver_dir
        FileUtilities.WriteDefaults(settingFile, defaults)
        print( 'Defaults updated')
        defaultsChanged = False
    elif ans == 'N':
        print( 'Defaults unchanged')
        defaultsChanged = False
    else:
        print( '\nInvalid input')

FileUtilities.ReadAllFiles(source_dir, topic_dir, driver_dir)
# end main()
