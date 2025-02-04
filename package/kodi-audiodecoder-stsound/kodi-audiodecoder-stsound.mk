################################################################################
#
# kodi-audiodecoder-stsound
#
################################################################################

KODI_AUDIODECODER_STSOUND_VERSION = 21.0.2-Omega
KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi

$(eval $(cmake-package))
