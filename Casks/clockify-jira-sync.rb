cask "clockify-jira-sync" do
  version "1.6.2"
  sha256 "6d2a73eb528aacdc64b5a31a305f97c435b43dc8008786f5fffd25f3e6b80155"

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
