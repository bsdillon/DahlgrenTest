#ifndef DRIVEREXCEPTION_H
#define DRIVEREXCEPTION_H

#include <exception>

class DriverException: public std::exception
{
  private:
    std::string message;
    int level;

  public:
    enum Level {
      NoEffect,
      UnstableProgram,
      DataLoss,
      Fatal
    };

    std::string InterpretLevel() const {
      std::string answer = "Unknown Error Type";
      switch ((Level)level)
      {
        case NoEffect:
          answer = "No Effect";
          break;
        case UnstableProgram:
          answer = "Unstable Program";
          break;
        case DataLoss:
          answer = "Data Loss";
          break;
        case Fatal:
          answer = "Fatal";
          break;
      }
      return answer;
    }

    DriverException(std::string s, Level l) {
      message = s;
      level = (int)l;
    }

    std::string getMessage() const {return message;}

    Level getLevel() const {return (Level)level;}
};
#endif
