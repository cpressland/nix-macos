{ ... }: {
  system.defaults = {
    CustomUserPreferences = {
      NSGlobalDomain = {
        AppleHighlightColor = "1.000000 0.749020 0.823529 Pink";
        AppleAccentColor = 6;
      };
      "~/Library/Preferences/com.apple.finder.plist" = {
        NewWindowTarget = "PfHm";
        FXRemoveOldTrashItems = true;
      };
      "~/Library/Preferences/com.apple.spotlight" = {
        orderedItems = [
          {"enabled" = 1;"name" = "APPLICATIONS";}
          {"enabled" = 1;"name" = "SYSTEM_PREFS";}
          {"enabled" = 1;"name" = "DIRECTORIES";}
          {"enabled" = 1;"name" = "PDF";}
          {"enabled" = 1;"name" = "FONTS";}
          {"enabled" = 0;"name" = "DOCUMENTS";}
          {"enabled" = 0;"name" = "MESSAGES";}
          {"enabled" = 0;"name" = "CONTACT";}
          {"enabled" = 0;"name" = "EVENT_TODO";}
          {"enabled" = 0;"name" = "IMAGES";}
          {"enabled" = 0;"name" = "BOOKMARKS";}
          {"enabled" = 0;"name" = "MUSIC";}
          {"enabled" = 0;"name" = "MOVIES";}
          {"enabled" = 0;"name" = "PRESENTATIONS";}
          {"enabled" = 0;"name" = "SPREADSHEETS";}
          {"enabled" = 0;"name" = "SOURCE";}
          {"enabled" = 0;"name" = "MENU_DEFINITION";}
          {"enabled" = 0;"name" = "MENU_OTHER";}
          {"enabled" = 0;"name" = "MENU_CONVERSION";}
          {"enabled" = 0;"name" = "MENU_EXPRESSION";}
          {"enabled" = 0;"name" = "MENU_WEBSEARCH";}
          {"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}
        ];
      };
      "~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari" = {
        ShowFullURLInSmartSearchField = true;
        PreloadTopHit = false;
        ShowFavoritesUnderSmartSearchField = false;
        IncludeDevelopMenu = true;
        WebKitDeveloperExtrasEnabledPreferenceKey = true;
        AutoFillPasswords = false;
        AutoFillCreditCardData = false;
        AutoFillFromAddressBook = false;
        AutoFillMiscellaneousForms = false;
        AutoOpenSafeDownloads = false;
        CloseTabsAutomatically = 3;
        HistoryAgeInDaysLimit = 365;
        FindOnPageMatchesWordStartsOnly = false;
      };
    };
    CustomSystemPreferences = {};
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      static-only = true;
      show-recents = false;
      orientation = "left";
      minimize-to-application = true;
      show-process-indicators = false;
    };
    finder = {
      ShowPathbar = true;
      ShowStatusBar = true;
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv";
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      CreateDesktop = false;
    };
    ActivityMonitor.ShowCategory = 100;
    trackpad.TrackpadThreeFingerDrag = true;
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
    universalaccess.closeViewScrollWheelToggle = true;
    NSGlobalDomain = {
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      PMPrintingExpandedStateForPrint = true;
      NSDocumentSaveNewDocumentsToCloud = false;
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleShowScrollBars = "Always";
      AppleTemperatureUnit = "Celsius";
      AppleKeyboardUIMode = 3;
    };
  };
}
