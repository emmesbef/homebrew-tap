cask "jirafy-clockwork" do
  version "1.10.22"
  sha256 "b02106b8e56ce7d89fba9193cb856db80d7ec1dfb872cb0e7815c920db60955a"

  url "https://gitlab.com/level-87/clockify-jira-sync/-/raw/main/downloads/jirafy-clockwork-v#{version}-macos-universal.zip"
  name "JiraFy Clockwork"
  desc "Desktop app to sync Clockify time entries with Jira worklogs"
  homepage "https://level-87.gitlab.io/"

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