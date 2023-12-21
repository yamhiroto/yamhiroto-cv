.PHONY: examples

CC = xelatex
OUTPUT_DIR = .
CV_DIR = src
CV_SRCS = $(shell find $(CV_DIR)/sections/ -name '*.tex')

examples: $(foreach x, coverletter cv, $x.pdf)

cv.pdf: $(CV_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

coverletter.pdf: $(CV_DIR)/coverletter.tex
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	rm -rf $(OUTPUT_DIR)/*.{pdf,fls,log,aux,fdb_latexmk}
	rm -rf $(CV_DIR)/*.{pdf,fls,log,aux,fdb_latexmk}

