from pydub import AudioSegment
from secret import LLAM_SECRET
from llamaapi import LlamaAPI
from gtts import gTTS
import json
import os

class Speaker():
    ACCENTS = {"Matilda":"com.au",
            "Jane":"co.uk",
            "Suzy":"us",
            "Rani":"co.in",
            "Bridget":"ie",
            "Annika":"co.za"}

    def __init__(self, accent="Suzy"):
        self.name = accent
        self.audio_file = f'{self.name}_speech.wav'
        self.text_file = f"{self.name}_output.txt"
        with open(self.text_file, "w") as file:
            file.write("")
        self.accent = Speaker.ACCENTS[accent]
        self.ALL_MESSAGES = []
        self.thinker = LlamaAPI(LLAM_SECRET)

    def send_to_api(self, text, callback):
        end_string = "\n---------------------------------\n"
        text_out =  f"{self.name}: Nothing{end_string}"

        self.ALL_MESSAGES.append({"role":"user", "content":text})
        # Create API request JSON
        thinker_request = {
            "model": "llama-13b-chat",
            "messages": self.ALL_MESSAGES,
        }

        # Make request and handle response
        response = self.thinker.run(thinker_request)
        response_json = json.loads(response.text)
        # Print only the relevant portion of the JSON response
        body = response_json["choices"][0]["message"]["content"]
        if len(body)>0:
            body = self.clean_emojis(body)
    
            #record the context       
            self.ALL_MESSAGES.append({"role":"system", "content":body})
            
            #put the text into an output file
            with open(self.text_file, "a") as file:
                file.write(body)

            #put the text on the screen
            text_out = f"{self.name}: {body}{end_string}"

            if not self.is_code(body):
                #if this isn't code, translate it into speech
                self.text_to_speech(body)
        callback(self.name, text_out, self.audio_file)

    def clean_emojis(self, text):
        return text.encode('ascii', 'ignore').decode('ascii')
        
    def is_code(self, text):
        code_triggers = ['{', '}', '[', ']', '=', '+', '/', '<', '>', ':', '#']
        for char in text:
            if char in code_triggers:
                return True
        return False

    def text_to_speech(self, text):
        try:
            os.remove(self.audio_file)
            textObj = gTTS(text=text, lang='en', tld=self.accent, slow=False)
            textObj.save(self.audio_file)
        except OSError as e:
            pass #no harm no foul; the file may not exist yet.

# import platform
# if platform.system() == 'Windows':
#     import msvcrt
# else:
#     import fcntl
# import os
        # while not self.is_file_ready(self.audio_file):
        #     time.sleep(50)
        
        # audio = AudioSegment.from_file(self.audio_file)
        # modified_audio = audio.speedup(playback_speed=2)
        # modified_audio.export(self.audio_file, format="wav")
        
        # while not self.is_file_ready(self.audio_file):
        #     time.sleep(50)
        
    # def is_file_ready(self, text):
    #     try:
    #         # Attempt to open the file in read-only mode
    #         file_descriptor = os.open(text, os.O_RDONLY)

    #         # Attempt to acquire an exclusive lock on the file
            
    #         if platform.system() == 'Windows':
    #             msvcrt.locking(file_descriptor, msvcrt.LK_NBLCK, 1)
    #         else:
    #             fcntl.flock(file_descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)

    #         # If we successfully acquired the lock, the file is not busy
    #         os.close(file_descriptor)
    #         return False
    #     except IOError:
    #         # If we failed to acquire the lock, the file is busy
    #         return True

# import pyttsx3
# import time
#     def __init__(self):
#         self.engine = pyttsx3.init()
#         time.sleep(2)

#     def text_to_speech(self, text):
#         voices = self.engine.getProperty('voices')
#         self.engine.setProperty('voice', voices[0].id) #0 male; 1 female
#         #volume = engine.getProperty('volume')
#         self.engine.setProperty('volume', 1.50)
#         self.engine.say(text)
#         self.engine.runAndWait()
#         print("done with speech")

# import pygame
            # _request = {
            #     "model": "llama-13b-chat",
            #     "messages": ALL_MESSAGES,
            # }

            # response = speaker.run(speaker_request)
            # if response.status_code == 200:
            #     audio_data = response.content
            #     with open("ai_speech.wav", "wb") as file:
            #         file.write(audio_data)
            #         file.close()
                
            #     play_to_speaker("ai_speech.wav")
            #     # Save or play the audio data

    
    # def play_to_speaker(filename):
    #     pygame.mixer.init()
    #     pygame.mixer.music.load(filename)
    #     pygame.mixer.music.play()
    #     while pygame.mixer.music.get_busy():
    #         continue
