(when (locate-library "cedet")
  (setq android-mode-sdk-dir "/home/aycan/Development/adt-bundle-linux-x86/sdk")
  (setq android-mode-avd "")
  (setenv "PATH"
          (concat
           "/home/aycan/Development/adt-bundle-linux-x86/sdk/tools" ";"
           "/home/aycan/Development/adt-bundle-linux-x86/sdk/tools/emulate" ";"
           (getenv "PATH")
           ))
  )
