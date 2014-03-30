CAT = cat
WGET = curl -s

UNZIP = unzip
MD5SUM = md5sum
RMDIR = $(RM) -r

DATA_DIR = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data
ODDIR = composteurs_collectifs_csv
ODZIP = $(ODDIR).zip
ODATA = $(DATA_DIR)/data_sig/dechets/composteurs_collectifs/$(ODZIP)
IN_FILE = $(ODDIR)/donnees/composteurs_collectifs.csv
IN_META = $(ODDIR)/metadonnees/'composteurs_collectifs (csv).txt'

all: $(ODDIR)

$(ODZIP):
	$(WGET) $(ODATA) > $(ODZIP)

$(ODDIR): $(ODZIP)
	$(UNZIP) $<

.PHONY: verif
verif: $(ODDIR)
	$(MD5SUM) $(IN_FILE)
	$(CAT) $(ODDIR).md5

clean:
	$(RM) $(ODZIP)
	$(RMDIR) $(ODDIR)

