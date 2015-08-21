ARCHS = arm64 armv7

include theos/makefiles/common.mk

BUNDLE_NAME = FTFaceWindowOpacity
FTFaceWindowOpacity_FILES = FTFaceWindowOpacity.mm BetterPSSliderTableCell.mm
FTFaceWindowOpacity_INSTALL_PATH = /Library/PreferenceBundles
FTFaceWindowOpacity_FRAMEWORKS = UIKit
FTFaceWindowOpacity_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FTFaceWindowOpacity.plist$(ECHO_END)
