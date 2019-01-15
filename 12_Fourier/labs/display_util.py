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

def images_diff(first_image, second_image):
    return np.abs(first_image - second_image)

def image(image, title, with_hist=False, size=(12, 12)):
    plt.style.use('dark_background')
    fig = plt.figure(figsize=size)
    fig.suptitle(title, fontsize = 25)
    ax1 = fig.add_subplot(121 if with_hist else 111)
    ax1.imshow(image, 'gray')
    ax1.set_title("image")

    if with_hist:
        ax2 = fig.add_subplot(122)
        ax2.hist(image.ravel(), 256, [0,256], color = '#9E7CC1')
        ax2.set_title("histogram")
    plt.show()