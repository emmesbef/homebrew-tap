cask "jirafy-clockwork" do
  version "1.10.17"
  sha256 "543f9f4c594739e0aed168dccae99cb797a90be313aa8770b8e5edb20a3c472f"

  url "https://gitlab.com/level-87/clockify-jira-sync/-/releases/v#{version}/downloads/jirafy-clockwork-v#{version}-macos-universal.zip"
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