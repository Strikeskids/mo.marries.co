all: manifest.txt

manifest.txt: index.html $(wildcard css/*.css) $(wildcard images/*.jpg images/*.png) $(wildcard *.ico *.png *.svg) browserconfig.xml site.webmanifest
	@echo "echo ... > $@"
	@echo $^ | tr ' ' '\n' > $@

deploy: manifest.txt
	rsync --times --delete --files-from=manifest.txt . sanguine:/var/www/mo.marries.co

.PHONY: all deploy
