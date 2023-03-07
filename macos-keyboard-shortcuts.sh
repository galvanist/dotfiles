# Set "option + tab" as the shortcut to "move focus to next window"
# based on https://stackoverflow.com/questions/823705/programatically-get-set-mac-osx-default-system-keyboard-shortcut/56395574#56395574
/usr/libexec/PlistBuddy -c "Delete :AppleSymbolicHotKeys:27:value:parameters" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value:parameters array" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value:parameters: integer 96" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value:parameters: integer 50" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value:parameters: integer 1048576" ~/Library/Preferences/com.apple.symbolichotkeys.plist
# /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:27:enabled bool true" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Delete :AppleSymbolicHotKeys:98:enabled" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:98:enabled bool true" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Ask the system to read the hotkey plist file and ignore the output. Likely updates an in-memory cache with the new plist values.
defaults read com.apple.symbolichotkeys.plist > /dev/null

# Run reactivateSettings to apply the updated settings.
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
