cask "clockify-jira-sync" do
  version "1.5.0"
  sha256 "33e99e297cae895f4019d47e40c73186b1d5851a5d6af5ded332aa491d9262bf"

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
