class Relationships:

    def __init__(self, sender, receiver):
        self.sender = sender
        self.receiver = receiver
        self.amount = 1

    def increment(self):
        self.amount += 1

    def get_sender(self):
        return str(self.sender)

    def get_receiver(self):
        return str(self.receiver)

    def get_amount(self):
        return self.amount

