import numpy as np
import cv2
import glob
from matplotlib import pyplot as plt
import os.path

MIN_MATCH_COUNT = 10
img2 = cv2.imread('T2 - Cat Laptop.jpg', 0)


for i in range(1, 5, 1):
    path = "E:/year4/PR/Sec/Lab8 - Final Project/Data set/Training"
    path = path + "/"
    path = path + str(i)
    path = path + "/*.jpg"

    for img in glob.glob(path):
        img1 = cv2.imread(img, 0)
        sift = cv2.xfeatures2d.SIFT_create()
        kp1, des1 = sift.detectAndCompute(img1, None)
        kp2, des2 = sift.detectAndCompute(img2, None)

        FLANN_INDEX_KDTREE = 0
        index_params = dict(algorithm=FLANN_INDEX_KDTREE, trees=5)
        search_params = dict(checks=50)
        flann = cv2.FlannBasedMatcher(index_params, search_params)
        matches = flann.knnMatch(des1, des2, k=2)
        Match = []
        matchesMask = [[0, 0] for i in range(len(matches))]
        for m, n in matches:
            if m.distance < 0.7 * n.distance:
                Match.append(m)
                matchesMask[i] = [1, 0]
        if len(Match) > MIN_MATCH_COUNT:


            draw_params = dict(matchColor=(0, 255, 0),
                               singlePointColor=(255, 0, 0),
                               matchesMask=matchesMask,
                               flags=0)
            if path == "E:/year4/PR/Sec/Lab8 - Final Project/Data set/Training/1/*.jpg":
                print ('Cat')
            if path == "E:/year4/PR/Sec/Lab8 - Final Project/Data set/Training/2/*.jpg":
                print ('Laptop')

            if path == "E:/year4/PR/Sec/Lab8 - Final Project/Data set/Training/3/*.jpg":
                print ('Apple')
            if path == "E:/year4/PR/Sec/Lab8 - Final Project/Data set/Training/4/*.jpg":
                print ('Car')
            if path == "E:/year4/PR/Sec/Lab8 - Final Project/Data set/Training/5/*.jpg":
                print('Helicopter')


            img3 = cv2.drawMatchesKnn(img1, kp1, img2, kp2, matches, None, **draw_params)
            plt.imshow(img3),plt.show()
