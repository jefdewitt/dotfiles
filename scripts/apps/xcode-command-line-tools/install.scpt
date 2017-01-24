(
xcode-select --install;
sleep 1;
osascript -e \
    'tell application "System Events" \\
        tell process "Install Command Line Developer Tools" \\
            keystroke return \\
            click button "Agree" of window "License Agreement"'
)

# from: http://www.techradar.com/how-to/computing/apple/terminal-101-running-applescripts-from-the-terminal-1305736