cask "jirafy-clockwork" do
  version "1.10.16"
  sha256 "a47d43abad0c71e7a6c3460f3be2d2a15b68b1d5c77159e60bd11ab34d16cdba"

  url "https://gitlab.com/level-87/clockify-jira-sync/-/packages/generic/jirafy-clockwork/v#{version}/jirafy-clockwork-v#{version}-macos-universal.zip"
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