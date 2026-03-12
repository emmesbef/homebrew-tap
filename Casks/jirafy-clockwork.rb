cask "jirafy-clockwork" do
  version :latest
  sha256 :no_check

  url "https://gitlab.com/level-87/clockify-jira-sync/-/releases/permalink/latest/downloads/jirafy-clockwork-macos-universal.zip"
  name "JiraFy Clockwork"
  desc "Desktop app to sync Clockify time entries with Jira worklogs"
  homepage "https://level-87.gitlab.io/"

  livecheck do
    skip "The cask follows the latest GitLab release permalink."
  end

  app "jirafy-clockwork.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/jirafy-clockwork.app"]
  end

  zap trash: [
    "~/Library/Application Support/jirafy-clockwork",
    "~/Library/Application Support/clockify-jira-sync",
    "~/Library/Preferences/com.wails.jirafy-clockwork.plist",
    "~/Library/Preferences/com.wails.clockify-jira-sync.plist",
  ]
end
