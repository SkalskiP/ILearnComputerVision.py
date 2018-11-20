import numpy as np
import matplotlib.pyplot as plt

def images_with_histograms(files_list, names_list=None, size=None):
    images_count = len(files_list)
    figsize = size if size else (14, 5 * images_count)
    names = names_list if names_list else [""] * images_count
    
    plt.style.use('dark_background')
    f, axarr = plt.subplots(images_count, 2, figsize=figsize)
    for index, (file, name) in enumerate(zip(files_list, names)):
        axarr[index, 0].imshow(file,'gray')
        axarr[index, 0].set_title(name)
        axarr[index, 1].hist(file.ravel(), 256, [0,256], color = '#9E7CC1')
        axarr[index, 1].set_title("{} histogram".format(name))
    plt.show()

def images(files_list, names_list=None, size=None):
    images_count = len(files_list)
    figsize = size if size else (8, 5 * images_count)
    names = names_list if names_list else [""] * images_count
    
    plt.style.use('dark_background')
    f, axarr = plt.subplots(images_count, 1, figsize=figsize)
    for index, (file, name) in enumerate(zip(files_list, names)):
        axarr[index, 0].imshow(file,'gray')
        axarr[index, 0].set_title(name)
    plt.show()