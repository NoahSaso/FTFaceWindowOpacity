ARCHS = arm64 armv7

include theos/makefiles/common.mk

TWEAK_NAME = FTFaceWindowOpacity
FTFaceWindowOpacity_FILES = Tweak.xm
FTFaceWindowOpacity_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 InCallService"
SUBPROJECTS += Preferences
include $(THEOS_MAKE_PATH)/aggregate.mk
