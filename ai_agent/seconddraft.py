from agentrunner import AgentRunner
import threading

chatbots_roles = [["Suzy","look for security problems in code"],
            ["Matilda","look for poorly defined identifiers in code"],
            ["Jane","look for missing documentation in code"],
            ["Rani","look for spelling errors in code"],
            ["Bridget","suggest new code when requested"],
            ["Annika","explain the code I share with you"]
        ]

one_role = [["Rani","look at code and give me suggestions for improvement"]]

if __name__ == "__main__":
    ar = AgentRunner(one_role)
    t = threading.Thread(target=ar.printQueue)
    t.start()
