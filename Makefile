export DOC_FILE="./documentation.md"
export DOC_TITLE="cdr"
export PA_FILE="./cdr"
export PA_DIR="./bin"
export PA_FORM="form.html"

pa-document:
	@echo "Generating documentation";
	parseArger document $(PA_FILE) --directory $(PA_DIR) --out $(DOC_FILE) --title $(DOC_TITLE)
pa-parse:
	@echo "Reparsing codebase";
	parseArger bulk-parse --file "$(PA_FILE)" --directory "$(PA_DIR)"
pa-complete:
	@echo "Generating bash auto-complete";
	parseArger completely "cdr" "$(PA_FILE)" --subcommand-directory "$(PA_DIR)" --no-run-completely
	@completely preview > completely.bash
pa-form:
	@echo "Generating html form";
	parseArger html-form "cdr" --command $(PA_FILE) --output $(PA_FORM)
pa-build: pa-parse pa-document pa-complete pa-form
