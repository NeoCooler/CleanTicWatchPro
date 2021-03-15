function Reboot {
    adb reboot
}

function RebootRecovery {
    adb reboot -recovery
}

function Install {
    adb install -t -r $PackagestoInstall
}

function adbKill {
    adb kill-server
}


function adbStart {
    adb start-server 
}

function adbWait {
    adb wait-for-device
}

adbKill
adbStart
adbWait

#$Devices = adb devices
#$Serialno = adb get-serialno
#$ScreenSize = adb shell wm size
$Model = adb shell getprop ro.product.model
#$Release = adb shell getprop ro.build.version.release
$SystemPackages = adb shell pm list packages -s
$UserPackages = adb shell pm list package -3
#$PackagesDisable = adb shell pm list package -d
#$PackagesEnable = adb shell pm list package -e


if ($Model -eq "TicWatch Pro") {
    write-host("Product Model : TicWatch Pro") -ForegroundColor green
    if ($SystemPackages -contains "package:com.mobvoi.wear.privacy.aw"){
        adb shell pm clear com.mobvoi.wear.privacy.aw
        adb shell pm reset-permissions com.mobvoi.wear.privacy.aw
        adb shell pm disable-user --user 0 com.mobvoi.wear.privacy.aw
        write-host("Privacy from mobvoi is now disable.") -ForegroundColor green
    }
    if ($SystemPackages -contains "package:com.mobvoi.ticwatch.jupiter.home"){
        adb shell pm clear com.mobvoi.ticwatch.jupiter.home
        adb shell cmd overlay disable com.mobvoi.ticwatch.jupiter.home
        adb shell pm reset-permissions com.mobvoi.ticwatch.jupiter.home
        adb shell pm disable-user --user 0 com.mobvoi.ticwatch.jupiter.home
        write-host("Jupiter Home from mobvoi is now disable.") -ForegroundColor green
    }
    if ($SystemPackages -contains "package:com.mobvoi.wear.fitness.aw"){
        adb shell pm clear com.mobvoi.wear.fitness.aw
        adb shell pm reset-permissions com.mobvoi.wear.fitness.aw
        adb shell pm disable-user --user 0 com.mobvoi.wear.fitness.aw
        write-host("Fitness from mobvoi is now disable.") -ForegroundColor green
    }
#    if ($SystemPackages -contains "package:com.mobvoi.wear.mcuservice.aw"){
#        adb shell pm clear com.mobvoi.wear.mcuservice.aw
#        adb shell pm reset-permissions com.mobvoi.wear.mcuservice.aw
#        adb shell pm disable-user --user 0 com.mobvoi.wear.mcuservice.aw
#        write-host("Service from mobvoi is now disable.") -ForegroundColor green
#    }
    if ($SystemPackages -contains "package:com.mobvoi.wear.account.aw"){
        adb shell pm clear com.mobvoi.wear.account.aw
        adb shell pm reset-permissions com.mobvoi.ticwatch.jupiter.home
        adb shell pm disable-user --user 0 com.mobvoi.wear.account.aw
        write-host("Account from mobvoi is now disable.") -ForegroundColor green
    }
    if ($SystemPackages -contains "package:com.mobvoi.wear.appsservice"){
        adb shell pm clear com.mobvoi.wear.appsservice
        adb shell pm reset-permissions com.mobvoi.wear.appsservice
        adb shell pm disable-user --user 0 com.mobvoi.wear.appsservice
        write-host("App. Service from mobvoi is now disable.") -ForegroundColor green
    }
    if ($SystemPackages -contains "package:com.mobvoi.wear.health.aw"){
        adb shell pm clear com.mobvoi.wear.health.aw
        adb shell pm reset-permissions com.mobvoi.wear.health.aw
        adb shell pm disable-user --user 0 com.mobvoi.wear.health.aw
        write-host("Health from mobvoi is now disable.") -ForegroundColor green
    }
    if ($SystemPackages -contains "package:com.mobvoi.companion.aw"){
        adb shell pm clear com.mobvoi.companion.aw
        adb shell pm reset-permissions com.mobvoi.companion.aw
        adb shell pm disable-user --user 0 com.mobvoi.companion.aw
        write-host("Companion from mobvoi is now disable.") -ForegroundColor green
    }
    if ($SystemPackages -contains "package:com.mobvoi.wear.watchface.aw"){
        adb shell pm clear com.mobvoi.wear.watchface.aw
        adb shell pm reset-permissions com.mobvoi.wear.watchface.aw
        adb shell pm disable-user --user 0 com.mobvoi.wear.watchface.aw
        write-host("Watchface from mobvoi is now disable.") -ForegroundColor green
    }
    if ($SystemPackages -contains "package:com.mobvoi.wear.system.aw"){
        adb shell pm clear com.mobvoi.wear.system.aw
        adb shell pm reset-permissions com.mobvoi.wear.system.aw
        adb shell pm disable-user --user 0 com.mobvoi.wear.system.aw
        write-host("System from mobvoi is now disable.") -ForegroundColor green
    }
    if ($UserPackages -contains "package:com.mobvoi.wear.sleep.aw"){
        adb shell pm clear com.mobvoi.wear.sleep.aw
        adb uninstall com.mobvoi.wear.sleep.aw
        write-host("Sleep from mobvoi is now uninstall.") -ForegroundColor green
    }
    if ($UserPackages -contains "package:com.mobvoi.wear.heartrate.aw"){
        adb shell pm clear com.mobvoi.wear.heartrate.aw
        adb uninstall com.mobvoi.wear.heartrate.aw
        write-host("Heartrate from mobvoi is now uninstall.") -ForegroundColor green
    }
}else {
   write-host("Watch not found or not compatible.") -ForegroundColor red
}

adbKill
Reboot
