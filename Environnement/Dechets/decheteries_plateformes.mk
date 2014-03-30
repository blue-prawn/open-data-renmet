CAT = cat
WGET = curl -s
UNZIP = unzip
MD5SUM = md5sum
RMDIR = $(RM) -r

DATA_DIR = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data
ODDIR = decheteries_plateformes_dv_csv
ODZIP = $(ODDIR).zip
ODATA = $(DATA_DIR)/data_sig/dechets/decheteries_plateformes_dv/$(ODZIP)
IN_FILE = $(ODDIR)/donnees/decheteries_plateformes_dv.csv

all: $(ODDIR)

$(ODZIP):
	$(WGET) $(ODATA) > $(ODZIP)

$(ODDIR): $(ODZIP)
	$(UNZIP) $<

md5: decheteries_plateformes_dv.csv.md5
decheteries_plateformes_dv.csv.md5: $(ODDIR)
	$(MD5SUM) $(IN_FILE) > $@

clean:
	$(RM) $(ODZIP)
	$(RMDIR) $(ODDIR)

