cask "jirafy-clockwork" do
  version :latest
  sha256 :no_check

  # Tracks the latest successful dist-latest artifact built in GitLab CI.
  url "https://gitlab.com/level-87/clockify-jira-sync/-/jobs/artifacts/dist-latest/raw/release-assets/jirafy-clockwork-macos-universal.zip?job=release_cross_platform"
  name "JiraFy Clockwork"
  desc "Desktop app to sync Clockify time entries with Jira worklogs"
  homepage "https://level-87.gitlab.io/"

  livecheck do
    skip "Cask follows the latest dist-latest artifact."
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
