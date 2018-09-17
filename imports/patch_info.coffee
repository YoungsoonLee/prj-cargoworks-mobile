replaceInFile = require('replace-in-file')
settings = require('../../settings.json')

patchInfo = =>
  # android
  await replaceInFile
    files: './android/app/src/main/res/values/strings.xml'
    from: /<string name="app_name">.*<\/string>/
    to: "<string name=\"app_name\">#{settings.name}</string>"

  await replaceInFile
    files: './android/app/build.gradle'
    from: /versionName ".*"/
    to: "versionName \"#{settings.version}\""

  await replaceInFile
    files: './android/app/build.gradle'
    from: /versionCode .*/
    to: "versionCode #{settings.build}"

  # ios
  await replaceInFile
    files: './ios/mobile_seed/info.plist'
    from: /<key>CFBundleDisplayName<\/key>\n\t<string>.*<\/string>/
    to: "<key>CFBundleDisplayName</key>\n\t<string>#{settings.name}</string>"

  await replaceInFile
    files: './ios/mobile_seed/info.plist'
    from: /<key>CFBundleShortVersionString<\/key>\n\t<string>.*<\/string>/
    to: "<key>CFBundleShortVersionString</key>\n\t<string>#{settings.version}</string>"

  await replaceInFile
    files: './ios/mobile_seed/info.plist'
    from: /<key>CFBundleVersion<\/key>\n\t<string>.*<\/string>/
    to: "<key>CFBundleVersion</key>\n\t<string>#{settings.build}</string>"

  if settings.isProduction
    await replaceInFile
      files: './ios/mobile_seed/AppDelegate.m'
      from: "jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@\"index\" fallbackResource:nil]"
      to: "jsCodeLocation = [[NSBundle mainBundle] URLForResource:@\"main\" withExtension:@\"jsbundle\"];"

  else
    await replaceInFile
      files: './ios/mobile_seed/AppDelegate.m'
      from: "jsCodeLocation = [[NSBundle mainBundle] URLForResource:@\"main\" withExtension:@\"jsbundle\"];"
      to: "jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@\"index\" fallbackResource:nil]"

  console.log "name: #{settings.name} patch done"
  console.log "version: #{settings.version} build: #{settings.build} patch done"
  console.log if settings.isProduction then 'production' else 'development'
  console.log "backend ip: #{if settings.isProduction then settings.productionBackendIp else settings.developmentBackendIp}"

patchInfo()
