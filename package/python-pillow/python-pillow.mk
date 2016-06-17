################################################################################
#
# python-pillow
#
################################################################################

PYTHON_PILLOW_VERSION = 3.2.0
PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
PYTHON_PILLOW_SITE = https://pypi.python.org/packages/source/P/Pillow
PYTHON_PILLOW_SETUP_TYPE = setuptools
PYTHON_PILLOW_DEPENDENCIES = $(if $(BR2_PACKAGE_JPEG),jpeg) \
      $(if $(BR2_PACKAGE_ZLIB),zlib) \
      $(if $(BR2_PACKAGE_TIFF),tiff) \
      $(if $(BR2_PACKAGE_FREETYPE),freetype) \
      $(if $(BR2_PACKAGE_WEBP),webp) \
      $(if $(BR2_PACKAGE_OPENJPEG),openjpeg)

PYTHON_PILLOW_BUILD_OPTS += --disable-platform-guessing
PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_JPEG),--enable-jpeg,--disable-jpeg)
PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_ZLIB),--enable-zlib,--disable-zlib)
PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_TIFF),--enable-tiff,--disable-tiff)
PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_FREETYPE),--enable-freetype,--disable-freetype)
PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_WEBP),--enable-webp,--disable-webp)
PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_OPENJPEG),--enable-jpeg2000,--disable-jpeg2000)

PYTHON_PILLOW_INSTALL_TARGET_OPTS += $(PYTHON_PILLOW_BUILD_OPTS)

PYTHON_PILLOW_BUILD_CMDS = (cd $(PYTHON_PILLOW_BUILDDIR); \
		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS))

PYTHON_PILLOW_INSTALL_TARGET_CMDS = (cd $(PYTHON_PILLOW_BUILDDIR); \
		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
		$(PYTHON_PILLOW_INSTALL_TARGET_OPTS) install \
		$(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS))

$(eval $(python-package))
