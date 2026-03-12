cask "jirafy-clockwork" do
  version "1.10.8"
  sha256 "17d1a08acc518d6c35fce89a3177885e8195102049bde0929790a4cad07cbc9c"

  # Uses a verified public GitLab artifact until release permalink publishing is fully stable.
  url "https://gitlab.com/level-87/clockify-jira-sync/-/jobs/13472161702/artifacts/raw/release-assets/jirafy-clockwork-v#{version}-macos-universal.zip"
  name "JiraFy Clockwork"
  desc "Desktop app to sync Clockify time entries with Jira worklogs"
  homepage "https://level-87.gitlab.io/"

  livecheck do
    skip "Version bumps are managed explicitly alongside release publishing."
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
