==============================================================================================================
                                            BMR Calculator
==============================================================================================================

Deshawn Dana
dashwen@csu.fullerton.edu
CPSC 411 Assignment 4
version 1.0
Copyright © 2016 Deshawn Dana. All rights reserved.

==============================================================================================================
                                        Required files to compile
==============================================================================================================

AppDelegate.h
AppDelegate.m
main.m
Person.h
Person.m
ViewController.h
ViewController.m
info.plist
Assets.xcassets (folder)
Base.Iproj (folder)

==============================================================================================================
                                         Instructions to compile
==============================================================================================================

You may use Xcode to compile
1.) copy entire bmr folder and bmr.xcodeproj to desired directory
2.) locate AnagramProblemObjC directory in xcode
3.) select build, and run, to compile

Optional: After build, if keyboard does not display during simulator
4.) at top of screen, click Simulator -> Hardware -> Keyboard -> Connect Hardware Keyboard
    and make sure it is checked

==============================================================================================================
                                               Test Data
==============================================================================================================

World Metric

Height - 180cm
Weight - 80kg
Age - 21
Male
bmr = 1904.7

US Metric

Height - 5ft
Inch - 11inch
Weight - 176lbs
bmr = 1653.6


==============================================================================================================
                                               Comments / Bugs
==============================================================================================================

** Note: If keyboard does not display properly on simulator, had to uncheck Connect Hardware Keyboard **
** see Instructions to compile to ensure proper setup **


-Use Iphone 5s layout in xcode to ensure proper display!
-The design implements a singleton along with the use of a Model View Controller design architecture
-No bugs to report


==============================================================================================================
                                                Credits
==============================================================================================================

http://www.tutorialspoint.com/objective_c/
http://www.stackoverflow.com

http://cdn.pcwallart.com/images/gradient-wallpaper-1.jpg
Dr. Shafae - singleton.m , simpleclass.m

