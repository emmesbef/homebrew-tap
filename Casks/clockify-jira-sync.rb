cask "clockify-jira-sync" do
  version "1.10.0"
  sha256 "eb55736e0175eb67837acdce2534ffc56a0e687a45a1f02f8fe1f1aefe4a576b"

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
