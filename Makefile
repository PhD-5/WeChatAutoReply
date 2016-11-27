THEOS_DEVICE_IP = 172.20.17.4
ARCHS = armv7 arm64
TARGET = iphone:latest:8.0

include theos/makefiles/common.mk

TWEAK_NAME = WeChatAutoReply
WeChatAutoReply_FILES = Tweak.xm
WeChatAutoReply_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk


