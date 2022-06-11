import cv2


def DecmalToBinary(argument):
	switcher = {
		0: "0000",
		1: "0001",
		2: "0010",
		3: "0011",
		4: "0100",
		5: "0101",
		6: "0110",
		7: "0111",
		8: "1000",
		9: "1001",
		10: "1010",
		11: "1011",
		12: "1100",
		13: "1101",
		14: "1110",
		15: "1111"

	}
	return switcher.get(argument, "-")


img = cv2.imread("TEST.bmp", 3)
img2 = img

height, width, chanal = img.shape
for H in range(0, height):
	for W in range(0, width):
		img2[H][W] = (img[H][W]) / 16
# for H in range(0, height):
# 	for W in range(0, width):
# 		print(img2[H][W],end='')
# 	print("\n")
f = open("TEST.coe", 'w')
f.write("memory_initialization_radix=2;\n")
f.write("memory_initialization_vector=")
for y in range(0, height):
	for x in range(0, width):
		data = img2[y][x]
		f.write(DecmalToBinary(data[2]))
		f.write(DecmalToBinary(data[1]))
		f.write(DecmalToBinary(data[0]))
		f.write(",")
f.write(";")
