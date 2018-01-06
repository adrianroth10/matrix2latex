module Matrix2latex
	export matrix2latex

	significants = 4

	function roundMatrix(matrix)
		out = zeros(size(matrix))
		for i in eachindex(matrix)
			out[i] = signif(matrix[i], significants)
		end
		return out
	end

	function matrix2latex(file::String, matrix::Matrix)
		matrix = roundMatrix(matrix)
		s = size(matrix)
		rows = Vector{String}(s[1])
		for i = 1:s[1]
			rows[i] = join(matrix[i, :], '&')
		end
		stream = open(file, "w")
		join(stream, rows, "\\\\\n")
		close(stream)
	end
	function matrix2latex(file::String, vector::Vector)
		vector = roundMatrix(vector)
		stream = open(file, "w")
		join(stream, vector, '&')
		close(stream)
	end
	function matrix2latex(file::String, number)
		number = signif(number, significants)
		stream = open(file, "w")
		write(stream, string(number))
		close(stream)
	end
end
