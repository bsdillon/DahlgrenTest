##############################################################################
# Stores the amount of connections between nodes (for communication diagrams)#
##############################################################################

class Relationships:

    def __init__(self, sender, receiver):
        self.sender = sender  # the sender node
        self.receiver = receiver  # the receiver node
        self.amount = 1  # the amount of times the nodes communicate between one another in the specific direction

    def increment(self):
        self.amount += 1

    def get_sender(self):
        return str(self.sender)

    def get_receiver(self):
        return str(self.receiver)

    def get_amount(self):
        return self.amount
