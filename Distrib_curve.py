import matplotlib.pyplot as plt
import numpy as np
from scipy import stats

def clean_data(filename):
    # initialize lists for pH and salinity values
    pH_values = []
    salinity_values = []
    # read in file
    file = open(filename, "r")
    # iterate over each line in the file, separate data points by comma
    for line in file:
        data_point = line.strip().split(",")
        # ignore lines with no data for one or both values
        if "ND" not in data_point:
            # append pH values to list as floats
            if data_point[1] != "pH":
                pH_values.append(float(data_point[1]))
            # append salinity values to list as floats
            if data_point[2] != "Salinity_dS_m":
                salinity_values.append(float(data_point[2]))
    return pH_values, salinity_values

def create_plot(data_list, x_label):
    # create an array of the data list
    data = np.array(data_list)
    # create smooth distribution curve 
    kde = stats.gaussian_kde(data)
    x = np.linspace(data.min(), data.max(), 200)
    plt.plot(x, kde(x), color='darkred', linewidth=2, label='KDE')
    plt.plot(x, kde(x), color='darkred', linewidth=2)
    plt.fill_between(x, kde(x), alpha=0.3, color='steelblue')
    # label axes and show plot
    plt.xlabel(x_label)
    plt.ylabel("Density")
    plt.show()

def main():
    pH_values, salinity_values = clean_data("SoilChem_NMDS.csv")
    create_plot(pH_values, "pH")
    create_plot(salinity_values, "Salinity")

main()