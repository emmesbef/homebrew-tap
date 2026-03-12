cask "jirafy-clockwork" do
  version :latest
  sha256 :no_check

  # Points to the latest signed macOS bundle committed for Homebrew distribution.
  url "https://gitlab.com/level-87/clockify-jira-sync/-/raw/main/downloads/jirafy-clockwork-macos-universal.zip"
  name "JiraFy Clockwork"
  desc "Desktop app to sync Clockify time entries with Jira worklogs"
  homepage "https://level-87.gitlab.io/"

  livecheck do
    skip "Cask follows the latest published download bundle."
  end

  app "JiraFy Clockwork.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/JiraFy Clockwork.app"]
  end

  zap trash: [
    "~/Library/Application Support/jirafy-clockwork",
    "~/Library/Application Support/clockify-jira-sync",
    "~/Library/Preferences/com.wails.jirafy-clockwork.plist",
    "~/Library/Preferences/com.wails.clockify-jira-sync.plist",
  ]
end
