cask "jirafy-clockwork" do
  version "1.10.24"
  sha256 "8d806d6cbb677796ac14afadd77ab455de0c2a275393f198b1d7420fd824fff4"

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