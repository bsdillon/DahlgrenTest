import time
import threading
from speaker import Speaker

#speech recording to text
import pyaudio
import pygame
import wave

class AgentRunner():
    speakers = []

    def __init__(self, roles):
        self.responses = {}
        pygame.init()
        pygame.mixer.init()
        self.roles = roles
        self.create_all()

    def create_all(self):
        print("========STARTING CHATBOTS========")
        rules = self.load_file("rules.txt")
        print("=================================")
        for pair in self.roles:
            speaker = Speaker(pair[0])
            self.speakers.append(speaker)
            t = threading.Thread(target=speaker.send_to_api, args=(f"My name is Brian. Your name is {pair[0]} and your job is to {pair[1]}. {rules}", self.queue_response))
            t.start()
            
        self.wait_on_responses()

    def to_all_speakers(self, text):
        self.responses = {}
        print("=================================")
        for s in self.speakers:
            t = threading.Thread(name=s.name+"THREAD", target=s.send_to_api, args=(text, self.queue_response))
            t.start()
            
        self.wait_on_responses()        
        
    def record_from_microphone(self, filename, duration=5, rate=44100, chunk=1024, channels=2):
        audio = pyaudio.PyAudio()
        stream = audio.open(format=pyaudio.paInt16,
                            channels=channels,
                            rate=rate,
                            input=True,
                            frames_per_buffer=chunk)
        frames = []
        for i in range(0, int(rate / chunk * duration)):
            data = stream.read(chunk)
            frames.append(data)
        
        stream.stop_stream()
        stream.close()
        audio.terminate()
        
        wf = wave.open(filename, 'wb')
        wf.setnchannels(channels)
        wf.setsampwidth(audio.get_sample_size(pyaudio.paInt16))
        wf.setframerate(rate)
        wf.writeframes(b''.join(frames))
        wf.close()

    def load_file(self, file_name):
        with open(file_name, "r") as file:
            content = file.read()
            print(content)
        return content

    def queue_response(self, name, text, audio):
        self.responses[name] = [text, audio]

    def wait_on_responses(self):
        while len(self.responses)<len(self.roles):
            percent = int(100*len(self.responses)/len(self.roles))
            print(f"Waiting...{percent}%", end="\r")
            time.sleep(.5)

        for name in self.responses:
            response = self.responses[name]
            print(response[0])
            if True:
                print(f"loading audio : {response[1]}")
                pygame.mixer.music.load(response[1], 'mp3')
                pygame.mixer.music.play()
                while pygame.mixer.music.get_busy():
                    pygame.time.Clock().tick(50)  # Adjust the tick rate as needed            


    def printQueue(self):
        # Infinite loop for chat prompts
        while True:
            # Prompt for user input
            prompt = input("You (talk/file/quit): ")

            if prompt.lower() == "quit":
                    break
            elif prompt.lower() == "talk":
                file_name = input("You have 15 seconds once you hit <ENTER> (exit): ")
                if file_name.lower() == "exit":
                    continue
                else:
                    try:
                        self.record_from_microphone("inputSpeech.wav", duration=15)
                        #Listener generates text
                        # contentsd = .....
                        # if len(contents)>0:
                        #     send_to_api(contents)
                        # else:
                        #     print(f"Could not hear your speech....")
                        
                    except Exception as ex:
                        print(f"Error: Could not hear your speech: {ex}")
                        continue
            elif prompt.lower() == "file":
                file_name = input("Enter file name (exit): ")
                if file_name.lower() == "exit":
                    continue
                else:
                    try:
                        contents = self.load_file(file_name)
                        if len(contents)>0:
                            self.to_all_speakers(f"This is a file for you to review:\n {contents}")
                        else:
                            print(f"Error: No data found")
                    except FileNotFoundError:
                        print(f"Error: File '{file_name}' not found.")
                        continue
            else:
                self.to_all_speakers(prompt)
