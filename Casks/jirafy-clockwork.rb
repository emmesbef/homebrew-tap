cask "jirafy-clockwork" do
  version "1.10.18"
  sha256 "16649a16f7090ef3ffda68bc6009c36c111045e140006ad150be92c769706916"

  url "https://gitlab.com/level-87/clockify-jira-sync/-/jobs/artifacts/v#{version}/raw/release-assets/jirafy-clockwork-v#{version}-macos-universal.zip?job=release_cross_platform"
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