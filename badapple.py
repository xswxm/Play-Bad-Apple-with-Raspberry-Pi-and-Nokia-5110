import time
import Adafruit_Nokia_LCD as LCD
import Adafruit_GPIO.SPI as SPI
import Image
import zipfile
import StringIO

# In order to play music
import pygame

print 'Press Ctrl-C to quit.'

# Raspberry Pi hardware SPI config:
DC = 23
RST = 24
SPI_PORT = 0
SPI_DEVICE = 0

# Hardware SPI usage:
disp = LCD.PCD8544(DC, RST, spi=SPI.SpiDev(SPI_PORT, SPI_DEVICE, max_speed_hz=4000000))

# Initialize library.
disp.begin(contrast=60)

# Clear display.
disp.clear()
disp.display()

# Read zip file
zfile = zipfile.ZipFile('/home/pi/badapple/BMP.zip', 'r')

# Play music
pygame.init()
pygame.mixer.music.load("badapple.ogg")
pygame.mixer.music.play()

# Time starting display image
timesta = time.time()

while True:
	# Time now
	timenow = time.time()
	# Calculate the frame to display
	frame = int((timenow - timesta)*30) + 1
	# Load image and convert to 1 bit color.
	# image = Image.open('/home/pi/badapple/BMP/ba' + str(frame) + '.bmp')
	image = Image.open(StringIO.StringIO(zfile.read('ba' + str(frame) + '.bmp')))
	disp.image(image)
	disp.display()
