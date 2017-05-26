.DEFAULT_GOAL := pdf

## Create PDF
pdf:
	r -q -e "rmarkdown::render('paper.Rmd', 'rticles::acm_article')"

# Create example (draft)
draft:
	r -q -e "rmarkdown::draft('MyArticle.Rmd', template = 'acm_article', package = 'rticles')"

## Show this help screen
help:
	@printf "Available targets\n\n"
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "%-30s %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
