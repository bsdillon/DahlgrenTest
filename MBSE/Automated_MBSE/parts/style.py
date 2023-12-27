class Sprite:
    RED_AIR = "sprite $redair {\n000000000000000\n0000000F0000000\n000000FFF000000\n00000FF0FF00000\n0000FF000FF0000\n000FF00000FF000\n00FF0000000FF00\n0FF000000000FF0\n000000000000000\n}\n"
    RED_SEA = "sprite $redsea {\n000000000000000\n0000000F0000000\n000000FFF000000\n00000FF0FF00000\n0000FF000FF0000\n000FF00000FF000\n00FF0000000FF00\n0FF000000000FF0\n00FF0000000FF00\n000FF00000FF000\n0000FF000FF0000\n00000FF0FF00000\n000000FFF000000\n0000000F0000000\n000000000000000\n}\n"
    BLUE_AIR = "sprite $blueair {\n000000000000000\n00000FFFFF00000\n0000FFFFFFF0000\n000FF00000FF000\n00FF0000000FF00\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n000000000000000\n}\n"
    BLUE_SEA = "sprite $bluesea {\n000000000000000\n00000FFFFF00000\n0000FFFFFFF0000\n000FF00000FF000\n00FF0000000FF00\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n00FF0000000FF00\n000FF00000FF000\n0000FFFFFFF0000\n00000FFFFF00000\n000000000000000\n}\n"
    GREEN_AIR = "sprite $greenair {\n000000000000000\n0FFFFFFFFFFFFF0\n0FFFFFFFFFFFFF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n000000000000000\n}\n"
    GREEN_SEA = "sprite $greensea {\n000000000000000\n0FFFFFFFFFFFFF0\n0FFFFFFFFFFFFF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FF000000000FF0\n0FFFFFFFFFFFFF0\n0FFFFFFFFFFFFF0\n000000000000000\n}\n"
    YELLOW_AIR = "sprite $yellowair {\n0000000000000000\n0000000FF0000000\n000000F00F000000\n00000F0000F00000\n00000F0000F00000\n000FFF0000FFF000\n00F0000000000F00\n0F000000000000F0\n0F000000000000F0\n00F0000000000F00\n000FFF0000FFF000\n0000000000000000\n}\n"
    YELLOW_SEA = "sprite $yellowsea {\n0000000000000000\n0000000FF0000000\n000000F00F000000\n00000F0000F00000\n00000F0000F00000\n000FFF0000FFF000\n00F0000000000F00\n0F000000000000F0\n0F000000000000F0\n00F0000000000F00\n000FFF0000FFF000\n00000F0000F00000\n00000F0000F00000\n000000F00F000000\n0000000FF0000000\n0000000000000000\n}\n"
    RED = "FF0000"
    BLUE = "0000FF"
    GREEN = "00FF00"
    YELLOW = "AAAA00"

class Icons:
    AMERICA = './parts/icons/America.png'
    AVENGER = './parts/icons/Avenger.png'
    BLUERIDGE = './parts/icons/BlueRidge.png'
    BURKE = './parts/icons/Burke.png'
    CYCLONE = './parts/icons/Cyclone.png'
    FORD = './parts/icons/Ford.png'
    FREEDOM = './parts/icons/Freedom.png'
    HARPERSFERRY = './parts/icons/HarpersFerry.png'
    INDEPENDENCE = './parts/icons/Independence.png'
    LAND = './parts/icons/Land.png'
    LOSANGELES = './parts/icons/LosAngeles.png'
    NIMITZ = './parts/icons/Nimitz.png'
    OHIO = './parts/icons/Ohio.png'
    PERRY = './parts/icons/Perry.png'
    SANANTONIO = './parts/icons/SanAntonio.png'
    TICONDEROGA = './parts/icons/Ticonderoga.png'
    WASP = './parts/icons/Wasp.png'
    ZUMWALT = './parts/icons/Zumwalt.png'

class ActorStyle:
    Bust=1
    Cube=2
    Stick=3

    actorStyle = Stick

    @staticmethod
    def setActorStyle(style):
        ActorStyle.actorStyle = style

    def printActorStyle():
        if ActorStyle.actorStyle == ActorStyle.Bust:
            return "skinparam actorStyle awesome\n"
        elif ActorStyle.actorStyle == ActorStyle.Cube:
            return "skinparam actorStyle hollow\n"
        else: #default case is stick figure
            return "skinparam actorStyle stick man\n"

class TextAlignment:
    Center="skinparam defaultTextAlignment center\n"
    Left="skinparam defaultTextAlignment left\n"
    Right="skinparam defaultTextAlignment right\n"

@staticmethod
def setGeneralColor(shape, bgcolor, bcolor, fcolor):
  return "skinparam "+shape+" {\n  backgroundColor "+bgcolor+"\n  borderColor "+bcolor+"\n  fontColor "+fcolor+"\n}\n"

@staticmethod
def setSprite(sprite,size,color):
  return "<$"+sprite+"*"+size+",color:"+color+">"

