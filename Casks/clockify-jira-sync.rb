cask "clockify-jira-sync" do
  version "1.8.1"
  sha256 "6c216291c736a0b0db88d3657f9d6f59b2f758c3fa52cd98d7ef5e990268eea3"

  url "https://github.com/emmesbef/clockify-jira-sync/releases/download/v#{version}/clockify-jira-sync-v#{version}-macos-universal.zip"
  name "Clockify Jira Sync"
  desc "Desktop app to sync Clockify time entries with Jira worklogs"
  homepage "https://emmesbef.github.io/clockify-jira-sync/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "clockify-jira-sync.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/clockify-jira-sync.app"]
  end

  zap trash: [
    "~/Library/Application Support/clockify-jira-sync",
    "~/Library/Preferences/com.wails.clockify-jira-sync.plist",
  ]
end
