loadTemplate("org.kde.plasma.desktop.defaultPanel");

var desktopsArray = desktopsForActivity(currentActivity());
for (let j = 0; j < desktopsArray.length; j++) {
  desktopsArray[j].wallpaperPlugin = "org.kde.image";
}
