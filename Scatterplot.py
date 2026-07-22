import matplotlib.pyplot as plt
import numpy as np

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

def create_plot(pH_values, salinity_values):
    # assign data to axes
    x = np.array(pH_values)
    y = np.array(salinity_values)
    # create vertical lines at experimental pH values
    plt.axvline(x=5, linestyle="--", color="purple")
    plt.axvline(x=7, linestyle="--", color="blue")
    plt.axvline(x=9, linestyle="--", color="green")
    # create horizontal lines at experimental salinity values
    plt.axhline(y=0, linestyle="--", color="purple")
    plt.axhline(y=23.4375, linestyle="--", color="blue")
    plt.axhline(y=46.875, linestyle="--", color="green")
    # create scatter plot
    plt.scatter(x, y, color = "black")
    # label axes and show plot
    plt.xlabel("pH")
    plt.ylabel("Salinity")
    plt.show()

def main():
    pH_values, salinity_values = clean_data("SoilChem_NMDS.csv")
    create_plot(pH_values, salinity_values)

main()