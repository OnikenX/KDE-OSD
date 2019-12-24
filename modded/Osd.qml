/* THIS IS A MODIFIED VERSION
 * 
 * Copyright 2014 Martin Klapetek <mklapetek@kde.org> (Original)
 * Copyright 2019 Koneko-Nyaa (Changes)
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import QtQuick.Window 2.2
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtra

PlasmaCore.Dialog {
    id: root
    location: PlasmaCore.Types.Floating
    type: PlasmaCore.Dialog.OnScreenDisplay
    outputOnly: true

    // The X11BypassWindowManagerHint flag stops KWin from forcibly re-centering the OSD.
    flags: Qt.X11BypassWindowManagerHint | Qt.FramelessWindowHint
    
    property int xPos: Screen.width - width - Math.round(Screen.height/25*(1+((Screen.width/Screen.height-1)*0.5)))
    property int yPos: Math.round(Screen.height/25)
    
    x: xPos
    y: yPos

    // OSD Timeout in msecs - how long it will stay on the screen
    property int timeout: 1800
    // This is either a text or a number, if showingProgress is set to true,
    // the number will be used as a value for the progress bar
    property var osdValue
    // Icon name to display
    property string icon
    // Set to true if the value is meant for progress bar,
    // false for displaying the value as normal text
    property bool showingProgress: false

    mainItem: OsdItem {
        rootItem: root
    }
}
