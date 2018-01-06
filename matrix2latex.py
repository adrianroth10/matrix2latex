import numpy as np

def matrix2latex(filename, matrix):
    f = open(filename, "w");


    if not type(matrix) == np.ndarray:
        f.write(str(matrix))
    else:
        s = matrix.shape
        if len(s) == 1:
            s = (1, s[0])
        for i in range(s[0]):
            for j in range(s[1] - 1):
                f.write(str(matrix[i, j]) + '&')
            f.write(str(matrix[i, -1]) + "\\\\\n")

    f.close()
