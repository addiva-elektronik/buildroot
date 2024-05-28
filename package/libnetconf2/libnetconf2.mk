################################################################################
#
# libnetconf2
#
################################################################################

LIBNETCONF2_VERSION = 3.0.17
LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
LIBNETCONF2_INSTALL_STAGING = YES
LIBNETCONF2_LICENSE = BSD-3-Clause
LIBNETCONF2_LICENSE_FILES = LICENSE
LIBNETCONF2_DEPENDENCIES = libyang libopenssl libcurl
HOST_LIBNETCONF2_DEPENDENCIES = host-libyang host-libopenssl host-libcurl

LIBNETCONF2_CONF_OPTS = \
	-DENABLE_TESTS=OFF \
	-DENABLE_VALGRIND_TESTS=OFF

ifeq ($(BR_PACKAGE_LINUX_PAM),y)
LIBNETCONF2_DEPENDENCIES += linux-pam
endif

ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
LIBNETCONF2_DEPENDENCIES += libssh
else
LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
endif

ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
LIBNETCONF2_DEPENDENCIES += openssl
else
LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
endif

HOST_LIBNETCONF2_CONF_OPTS = \
	-DENABLE_TESTS=OFF \
	-DENABLE_VALGRIND_TESTS=OFF \
	-DENABLE_SSH=OFF \
	-DENABLE_TLS=OFF

$(eval $(cmake-package))
$(eval $(host-cmake-package))
