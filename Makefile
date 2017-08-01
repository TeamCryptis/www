JEKYLL=bundle exec jekyll

all: build

build:
	${JEKYLL} build

run:
	${JEKYLL} serve
