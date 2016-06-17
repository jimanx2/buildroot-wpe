################################################################################
#
# pythonnet
#
################################################################################

PYTHONNET_VERSION = 2.1.0
PYTHONNET_SOURCE = pythonnet-$(PYTHONNET_VERSION).zip
PYTHONNET_SITE = https://pypi.python.org/packages/b3/06/df4041021d83931ec3d963e782a05d115e99a0dd266cbedf408bda8840d5
PYTHONNET_SETUP_TYPE = setuptools

define PYTHONNET_EXTRACT_CMDS
        $(UNZIP) -d $(@D) $(DL_DIR)/$(PYTHONNET_SOURCE)
        mv $(@D)/pythonnet-$(PYTHONNET_VERSION)/* $(@D)
        $(RM) -r $(@D)/pythonnet-$(PYTHONNET_VERSION)
endef
$(eval $(python-package))
