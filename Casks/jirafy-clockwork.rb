cask "jirafy-clockwork" do
  version "1.11.1"
  sha256 "c3eeccf30ce7e0be564716f072f6e95992292f3631a7ccc0bf95c79b6cd4eeee"

  url "https://gitlab.com/level-87/clockify-jira-sync/-/raw/main/downloads/jirafy-clockwork-v#{version}-macos-universal.zip"
  name "JiraFy Clockwork"
  desc "Desktop app to sync Clockify time entries with Jira worklogs"
  homepage "https://level-87.gitlab.io/"

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