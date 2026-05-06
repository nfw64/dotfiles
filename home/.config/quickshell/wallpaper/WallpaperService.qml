pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property list<string> wallpapers: []
    property string currentWallpaper: ""
    property string backend: "awww"

    // Scan wallpaper directories
    Process {
        id: scanner
        command: ["sh", "-c", "find ~/Media/pictures/wallpapers/ ~/Pictures -maxdepth 2 -type f \\( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \\) 2>/dev/null | sort -u | head -200"]
        running: false
        stdout: SplitParser {
            onRead: data => {
                const path = data.trim();
                if (path !== "") {
                    root.wallpapers = [...root.wallpapers, path];
                }
            }
        }
    }

    // Load saved wallpaper path
    FileView {
        id: configFile
        path: Quickshell.env("HOME") + "/.config/quickshell/wallpaper.conf"
        onTextChanged: {
            const saved = configFile.text().trim();
            if (saved !== "")
                root.currentWallpaper = saved;
        }
    }

    FileView {
        id: themeConfRead
        path: Quickshell.env("HOME") + "/.config/quickshell/theme.conf"
        watchChanges: true
        onFileChanged: reload()

        readonly property int themeIndex: parseInt(text().trim()) || 0
    }

    Component.onCompleted: {
        scanner.running = true;
    }

    function rescan() {
        wallpapers = [];
        scanner.running = true;
    }

    function setWallpaper(path) {
        currentWallpaper = path;
        notifyd.running = true;

        if (themeConfRead.themeIndex === 1) {
            notifyd.command = ["notify-send", "-a", "Matugen", "-n", "settings", "Processing theme ..."];
            setProca.command = ["awww", "img", "--transition-type", "grow", "--transition-fps", "60", "--transition-duration", "0.8", path];
            setProca.running = true;
            setProcess.command = ["matugen", "--source-color-index", "0", "image", path];
        } else {
            setProcess.command = ["awww", "img", "--transition-type", "grow", "--transition-fps", "60", "--transition-duration", "0.8", path];
        }
        setProcess.running = true;

        // Save to config
        saveProcess.command = ["sh", "-c", 'printf "%s" "$1" > "$HOME/.config/quickshell/wallpaper.conf"', "sh", path];
        saveProcess.running = true;
    }

    Process {
        id: setProcess
        command: []
        running: false

        onRunningChanged: {
            if (!running) {
                dismisser.running = true;
            }
        }
    }
    Process {
        id: setProca
        command: []
        running: false
    }

    Process {
        id: notifyd
        command: []
        running: false
    }

    Process {
        id: dismisser
        command: ["qs", "ipc", "call", "notifications", "dismiss_all"]
        running: false
    }

    Process {
        id: saveProcess
        command: []
        running: false
    }
}
