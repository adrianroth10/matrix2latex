import numpy as np

def print_number(f, number):
    if not type(number) == int:
        if number.is_integer():
            number = int(number)
        else:
            number = round(number,
                        -int(np.floor(np.log10(abs(number)))) + 1)
    f.write(str(number))

def scalar2latex(filename, scalar):
    f = open(filename, "w");
    print_number(f, scalar)
    f.close()

def vector2latex(filename, vector):
    f = open(filename, "w");
    s = vector.size
    for i in range(s - 1):
        print_number(f, vector[i])
        f.write('&')
    print_number(f, vector[-1])
    f.close()

def matrix2latex(filename, matrix):
    if not type(matrix) == np.ndarray:
        scalar2latex(filename, matrix)
    elif len(matrix.shape) == 1:
        vector2latex(filename, matrix)
    else:
        f = open(filename, "w");
        r, c = matrix.shape
        for i in range(r):
            for j in range(c - 1):
                print_number(f, matrix[i, j])
                f.write('&')
            print_number(f, matrix[i, -1])
            f.write("\\\\\n")
        f.close()
