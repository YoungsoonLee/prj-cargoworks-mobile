replaceInFile = require('replace-in-file')
packageJson = require('../../package.json')

patchVersion = =>
  await replaceInFile
    files: './android/app/build.gradle'
    from: /versionName ".+"/
    to: "versionName \"#{packageJson.version}\""

  await replaceInFile
    files: './android/app/build.gradle'
    from: /versionCode .+/
    to: "versionCode #{packageJson.build}"

  await replaceInFile
    files: './ios/mobile_seed/info.plist'
    from: /<key>CFBundleShortVersionString<\/key>\n\t<string>.+<\/string>/
    to: "<key>CFBundleShortVersionString</key>\n\t<string>#{packageJson.version}</string>"

  await replaceInFile
    files: './ios/mobile_seed/info.plist'
    from: /<key>CFBundleVersion<\/key>\n\t<string>.+<\/string>/
    to: "<key>CFBundleVersion</key>\n\t<string>#{packageJson.build}</string>"

  console.log "version: #{packageJson.version} build: #{packageJson.build} patch done"

patchVersion()
