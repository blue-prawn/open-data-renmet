CAT = cat
WGET = curl -s

DATA_DIR = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/budget/MAJ_CSV_Budget

ODATA1 = $(DATA_DIR)/CA_2010_Open_DATA_Subventions_d_equipement.csv
ODATA2 = $(DATA_DIR)/CA_2010_Open_DATA_Subventions_ordinaires_de_fonctionnement.csv
ODATA3 = $(DATA_DIR)/CA_2010_Open_DATA_Subventions_exceptionnelles_de_fonctionnement.csv

all: \
  subv_assoc_equipement_2010.csv \
  subv_assoc_ord_fonct_2010.csv \
  subv_assoc_exc_fonct_2010.csv \
  #End

.PHONY: subv_assoc_equipement_2010.csv
subv_assoc_equipement_2010.csv:
	$(WGET) '$(ODATA1)' > $@

.PHONY: subv_assoc_ord_fonct_2010.csv
subv_assoc_ord_fonct_2010.csv:
	$(WGET) '$(ODATA2)' > $@

.PHONY: subv_assoc_exc_fonct_2010.csv
subv_assoc_exc_fonct_2010.csv:
	$(WGET) '$(ODATA3)' > $@

clean:
	$(RM) subv_assoc_equipement_2010.csv
	$(RM) subv_assoc_ord_fonct_2010.csv
	$(RM) subv_assoc_exc_fonct_2010.csv

