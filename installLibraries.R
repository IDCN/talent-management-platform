# Copyright (c) 2018 Jon Middleton. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =============================================================================

#Clear console.
cat("\014")

#Check for package installations.
installed.packages()

#Package development tools.
install.packages("devtools")

#Data cleansing packages.
install.packages("tidyr")
install.packages("dplyr")

#Plot package.
install.packages("ggplot2")

#Java dependent packages.
install.packages("rJava")
install.packages("xlsx")
install.packages("mailR")
install.packages("googlesheets")

#Font embedding packages.
install.packages("extrafontdb")
install.packages("extrafont")

#NOTES:
#The extrafontdb package is meant to be used with the extrafont package.
#The extrafont package contains the code to install and use fonts, while 
#the extrafontdb package contains the font database. (When initially 
#installed, this package is essentially empty, except for some directories; 
#the database itself is created by the extrafont package).
#https://github.com/wch/extrafontdb

#install.packages("Cairo")

#NOTES:
#To install Cairo on Mac OS X, first ensure that X11, Xcode, and MacPorts
#are installed. Then install Cairo using MacPorts: sudo port install cairo
#Next, the /usr/X11/ directory must be copied into /X11/include/cairo/
