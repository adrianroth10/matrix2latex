import numpy as np

def print_number(f, number):
    if not type(number) == int:
        if number.is_integer():
            number = int(number)
        else:
            number = round(number, 2)
    f.write(str(number))

def matrix2latex(filename, matrix):
    f = open(filename, "w");


    if not type(matrix) == np.ndarray:
        f.write(str(matrix))
    else:
        s = matrix.shape
        if len(s) == 1:
            s = (1, s[0])
            matrix = np.reshape(matrix, s)
        for i in range(s[0]):
            for j in range(s[1] - 1):
                print_number(f, matrix[i, j])
                f.write('&')
            print_number(f, matrix[i, -1])
            f.write("\\\\\n")

    f.close()
