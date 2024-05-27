import logging
import inspect


# CRITICAL (level 50): Used for critical errors that cause the application to fail or become unusable. These messages should be addressed immediately.
# ERROR (level 40): Used for error messages that indicate a problem in the application's functionality but do not render it unusable. These messages should be addressed to ensure correct operation.
# WARNING (level 30): Used for warning messages that indicate a potential issue but do not cause the application to fail. These messages should be investigated to prevent future issues.
# INFO (level 20): Used for informational messages that describe the application's state or progress. These messages provide useful context for understanding the application's behavior.
TRACE_LEVEL = 15 #: Use for program flow measurement in/out of functions and critical code blocks
# DEBUG (level 10): Used for debugging messages that provide detailed information about the application's state, variables, or intermediate results. These messages are typically used to diagnose and fix issues during development.
logging.addLevelName(TRACE_LEVEL, "TRACE")
UNIVERSAL_LOG_LEVEL = logging.CRITICAL

class CallNameFilter(logging.Filter):
    def filter(self, record):
        # Extract the calling class
        record.className = record.name.split(".")[-1]

        # Extract the calling function name and line number
        caller_frame = inspect.stack()[6]
        record.caller_line = caller_frame.lineno
        record.caller_function_name = caller_frame.function
        return True

class IndentFormatter(logging.Formatter):
    def format(self, record):
        #enforce indenting related to the call stack which helps readability
        record.indent = (int(record.level)*"  ")
        return super().format(record)
        
class LogManager():
    known_loggers = {}
    indent = 0
    
    def __init__(self,log_name):
        #Multiton (see https://en.wikipedia.org/wiki/Multiton_pattern) - one instance per class name
        #Like a singleton except each class gets its own logger by name.
        if not (log_name in LogManager.known_loggers):
            newLogger = logging.getLogger(log_name)

            newLogger.addFilter(CallNameFilter())        
            formatter = IndentFormatter('%(indent)s%(levelname)s %(asctime)s-- %(className)s.%(caller_function_name)s[%(caller_line)d]: %(message)s', datefmt="%H:%M:%S")
            stream_handler = logging.StreamHandler()
            stream_handler.setFormatter(formatter)
            newLogger.addHandler(stream_handler)

            newLogger.setLevel(UNIVERSAL_LOG_LEVEL)
            LogManager.known_loggers[log_name] = newLogger

        self.logger = LogManager.known_loggers[log_name]

    def update_log_level(self, level):
        '''
        Used to set log levels for individual loggers independent of the universal value
        '''
        self.logger.setLevel(level)

    def log_at(self, msg, log_level, indent_delta=0, *args, **kwargs):
        '''
        Exclusively for intern calls. log_at applies uniform treatment of logging and formatting.
        '''
        if self.logger.isEnabledFor(log_level):
            if indent_delta<0:
                LogManager.indent += indent_delta
            self.logger._log(log_level, msg, args, kwargs, extra={'level': LogManager.indent})
            if indent_delta>0:
                LogManager.indent += indent_delta

    def debug(self, msg, indent_delta=0):
        '''
        Used for debugging messages that provide detailed information about the application's state, 
        variables, or intermediate results. These messages are typically used to diagnose and fix 
        issues during development.
        
        indent_delta - increase by 1 at the start of a method, -1 at the end. All other cases are 
        assumed to be 0 i.e. at the same level.
        '''
        self.log_at(msg, logging.DEBUG, indent_delta)

    def trace(self, msg, indent_delta=0):
        '''
        Used for program flow measurement in/out of functions and critical code blocks
        
        indent_delta - increase by 1 at the start of a method, -1 at the end. All other cases are 
        assumed to be 0 i.e. at the same level.
        '''
        self.log_at(msg, TRACE_LEVEL, indent_delta)

    def info(self, msg, indent_delta=0):
        '''
        Used for informational messages that describe the application's state or progress. These 
        messages provide useful context for understanding the application's behavior.
        
        indent_delta - increase by 1 at the start of a method, -1 at the end. All other cases are 
        assumed to be 0 i.e. at the same level.
        '''
        self.log_at(msg, logging.INFO, indent_delta)

    def warn(self, msg, indent_delta=0):
        '''
        Used for warning messages that indicate a potential issue but do not cause the application 
        to fail. These messages should be investigated to prevent future issues.
        
        indent_delta - increase by 1 at the start of a method, -1 at the end. All other cases are 
        assumed to be 0 i.e. at the same level.
        '''
        self.log_at(msg, logging.WARN, indent_delta)

    def error(self, msg, indent_delta=0):
        '''
        Used for error messages that indicate a problem in the application's functionality but
        do not render it unusable. These messages should be addressed to ensure correct operation.
        
        indent_delta - increase by 1 at the start of a method, -1 at the end. All other cases are 
        assumed to be 0 i.e. at the same level.
        '''
        self.log_at(msg, logging.ERROR, indent_delta)

    def critical(self, msg, indent_delta=0):
        '''
        Used for critical errors that cause the application to fail or become unusable. These 
        messages should be addressed immediately.
        
        indent_delta - increase by 1 at the start of a method, -1 at the end. All other cases are 
        assumed to be 0 i.e. at the same level.
        '''
        self.log_at(msg, logging.CRITICAL, indent_delta)
