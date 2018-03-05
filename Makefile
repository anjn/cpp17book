
all : book

clean :
	rm -f docs/index.html
	rm -f bin/sample-code-checker

test : cpptest texttest

texttest : *.md
	textlint -f unix *.md

cpptest : test-tool
	bin/sample-code-checker *.md

retest : test-tool
	bin/sample-code-checker retest /tmp/sample-code-checker/*.cpp

test-tool : bin/sample-code-checker

bin/sample-code-checker : bin/sample-code-checker.cpp
	g++ -D _ISOC11_SOURCE -std=c++14 --pedantic-errors -Wall -pthread -O2 -o bin/sample-code-checker  bin/sample-code-checker.cpp

book : docs/index.html


docs/index.html : *.md style.css
	pandoc -s --toc --toc-depth=6 --mathjax -o $@ -H style.css  pandoc_title_block *-*.md

index.md : *.md
	pandoc -s --toc --toc-depth=6 --mathjax -o index.md -H style.css  pandoc_title_block *-*.md

cpp17book.pdf : *.md default.latex
	pandoc -s -N --toc --toc-depth=6 -o cpp17book.pdf --pdf-engine=xelatex \
    -V papersize=b5 -V geometry:margin=0.4in,top=0.65in,bottom=0.5in \
    --template=default.latex pandoc_title_block *-*.md

.PHONY : all book clean test test-tool texttest cpptest retest
