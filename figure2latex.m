function figure2latex(file, caption)

if isa(file, 'char')
  texName = file;
elseif isa(file, 'cell')
  texName = file{1};
end


fid = fopen(texName, 'w');;
fprintf(fid, ['\\begin{figure}[H]\n']);
fprintf(fid, ['\t\\centering\n']);

split = strsplit(texName, '.');
name = split{1};
label = strrep(name, '_', ':');

if isa(file, 'char')
  print([name '.pdf'], '-dpdf')
  fprintf(fid, ['\t\\includegraphics[width = .8\\textwidth]{' pwd '/' name '.pdf}\n']);
elseif isa(file, 'cell')
  for i = 1:length(file)
    split = strsplit(file{i}, '.');
    name = split{1};
    figure(i)
    print([name '.pdf'], '-dpdf')
    fprintf(fid, ['\t\\includegraphics[width = .49\\textwidth]{' pwd '/' name '.pdf}\n']);
  end
end

fprintf(fid, ['\t\\caption{' caption '}\n']);
fprintf(fid, ['\t\\label{fig:' label '}\n']);
fprintf(fid, ['\\end{figure}']);
fclose(fid);

end
