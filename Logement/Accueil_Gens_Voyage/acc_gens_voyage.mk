CAT = cat
WGET = curl -s

UNZIP = unzip
MD5SUM = md5sum
RMDIR = $(RM) -r

DATA_DIR = http://www.data.rennes-metropole.fr/
DATA_PATH = fileadmin/user_upload/data/data_sig/terrain_accueil_gens_du_voyage/terrain_accueil_gens_du_voyage/

# ================================================================
# Several Formats:

# DXF/DWG (L93)
DIR_DXF_L93 = terrain_accueil_gens_du_voyage_dxf_lamb93

# DXF/DWG (CC48)
DIR_DXF_C48 = terrain_accueil_gens_du_voyage_dxf_lambcc48

# DXF/DWG (WGS84)
DIR_DXF_W84 = terrain_accueil_gens_du_voyage_dxf_wgs84

# KML
DIR_KML_W84 = terrain_accueil_gens_du_voyage_kml_wgs84

# SHP (L93)
DIR_SHP_L93 = terrain_accueil_gens_du_voyage_shp_lamb93

# SHP (CC48)
DIR_SHP_L48 = terrain_accueil_gens_du_voyage_shp_lambcc48

# SHP (WGS84)
DIR_SHP_W84 = terrain_accueil_gens_du_voyage_shp_wgs84

# ================================================================

ARCH_DXF_L93 = $(DIR_DXF_L93).zip
ARCH_DXF_C48 = $(DIR_DXF_C48).zip
ARCH_DXF_W84 = $(DIR_DXF_W84).zip
ARCH_KML_W84 = $(DIR_KML_W84).zip
ARCH_SHP_L93 = $(DIR_SHP_L93).zip
ARCH_SHP_L48 = $(DIR_SHP_L48).zip
ARCH_SHP_W84 = $(DIR_SHP_W84).zip

# ================================================================

all: \
  $(ARCH_DXF_L93) \
  $(ARCH_DXF_C48) \
  $(ARCH_DXF_W84) \
  $(ARCH_KML_W84) \
  $(ARCH_SHP_L93) \
  $(ARCH_SHP_L48) \
  $(ARCH_SHP_W84) \
  #End

$(ARCH_DXF_L93):
	$(WGET) $(DATA_DIR)$(DATA_PATH)$@ > $@
$(ARCH_DXF_C48):
	$(WGET) $(DATA_DIR)$(DATA_PATH)$@ > $@
$(ARCH_DXF_W84):
	$(WGET) $(DATA_DIR)$(DATA_PATH)$@ > $@
$(ARCH_KML_W84):
	$(WGET) $(DATA_DIR)$(DATA_PATH)$@ > $@
$(ARCH_SHP_L93):
	$(WGET) $(DATA_DIR)$(DATA_PATH)$@ > $@
$(ARCH_SHP_L48):
	$(WGET) $(DATA_DIR)$(DATA_PATH)$@ > $@
$(ARCH_SHP_W84):
	$(WGET) $(DATA_DIR)$(DATA_PATH)$@ > $@

# ================================================================

.PHONY: unarch
unarch: \
  $(ARCH_DXF_L93) \
  $(ARCH_DXF_C48) \
  $(ARCH_DXF_W84) \
  $(ARCH_KML_W84) \
  $(ARCH_SHP_L93) \
  $(ARCH_SHP_L48) \
  $(ARCH_SHP_W84)
	$(UNZIP) $(ARCH_DXF_L93)
	$(UNZIP) $(ARCH_DXF_C48)
	$(UNZIP) $(ARCH_DXF_W84)
	$(UNZIP) $(ARCH_KML_W84)
	$(UNZIP) $(ARCH_SHP_L93)
	$(UNZIP) $(ARCH_SHP_L48)
	$(UNZIP) $(ARCH_SHP_W84)

# ================================================================

.PHONY: sign
sign:
	$(MD5SUM) \
	  $(ARCH_DXF_L93) \
	  $(ARCH_DXF_C48) \
	  $(ARCH_DXF_W84) \
	  $(ARCH_KML_W84) \
	  $(ARCH_SHP_L93) \
	  $(ARCH_SHP_L48) \
	  $(ARCH_SHP_W84) \
	  #End

# ================================================================

clean:
	$(RM) $(ARCH_DXF_L93)
	$(RM) $(ARCH_DXF_C48)
	$(RM) $(ARCH_DXF_W84)
	$(RM) $(ARCH_KML_W84)
	$(RM) $(ARCH_SHP_L93)
	$(RM) $(ARCH_SHP_L48)
	$(RM) $(ARCH_SHP_W84)
	
	$(RMDIR) $(DIR_DXF_L93)
	$(RMDIR) $(DIR_DXF_C48)
	$(RMDIR) $(DIR_DXF_W84)
	$(RMDIR) $(DIR_KML_W84)
	$(RMDIR) $(DIR_SHP_L93)
	$(RMDIR) $(DIR_SHP_L48)
	$(RMDIR) $(DIR_SHP_W84)

