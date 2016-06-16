################################################################################
#
# pythonnet
#
################################################################################

PYTHONNET_VERSION = 2.1.0
PYTHONNET_SOURCE = pythonnet-$(PYTHONNET_VERSION).zip
PYTHONNET_SITE = https://pypi.python.org/packages/b3/06/df4041021d83931ec3d963e782a05d115e99a0dd266cbedf408bda8840d5
PYTHONNET_DEPENDENCIES = python host-python-setuptools host-python-distutilscross

define PYTHONNET_EXTRACT_CMDS
	(unzip $(DL_DIR)/$(PYTHONNET_SOURCE) -d $(BUILD_DIR); \
	mv $(BUILD_DIR)/pythonnet-$(PYTHONNET_VERSION)/* $(@D))
endef

define PYTHONNET_BUILD_CMDS
	(cd $(@D); \
		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
	$(HOST_DIR)/usr/bin/python setup.py build -x build_ext)
endef

define PYTHONNET_INSTALL_TARGET_CMDS
	(cd $(@D); \
	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
	$(HOST_DIR)/usr/bin/python setup.py install \
	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
