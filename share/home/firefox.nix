{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
    profiles.default = {
      id = 0;
      isDefault = true;
      name = "Default";
      search = {
        default = "DuckDuckGo";
        force = true;
      };
      settings = {
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.aboutConfig.showWarning" = "false";
        "browser.urlbar.maxRichResults" = 20;
        "layout.spellcheckDefault" = 2;
        "media.ffmpeg.vaapi.enabled" = true;
      };
    };
  };
}
