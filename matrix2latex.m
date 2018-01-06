function matrix2latex(filename, matrix)

% delete(filename);
fid = fopen(filename, 'w');

s = size(matrix);

if (s == [1, 1])
  fprintf(fid, '%s', num2str(matrix));

else
  for i = 1:(s(1))
    for j = 1:(s(2) - 1)
      fprintf(fid, '%s&', num2str(matrix(i, j)));
    end
    fprintf(fid, '%s\\\\\n', num2str(matrix(i, s(2))));
  end

end

fclose(fid);

end
