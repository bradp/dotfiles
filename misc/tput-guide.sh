#! /usr/bin/env bash

# Bing bong.
tput bel

# Reset color and attributes.
tput sgr0

# Set background color.
tput setab 0 # Set background to black.
tput setab 1 # Set background to red.
tput setab 2 # Set background to green.
tput setab 3 # Set background to yellow.
tput setab 4 # Set background to blue.
tput setab 5 # Set background to magenta.
tput setab 6 # Set background to cyan.
tput setab 7 # Set background to white.
tput setab 9 # Set background to default.

# Set foreground color
tput setaf 0 # Set foreground to black.
tput setaf 1 # Set foreground to red.
tput setaf 2 # Set foreground to green.
tput setaf 3 # Set foreground to yellow.
tput setaf 4 # Set foreground to blue.
tput setaf 5 # Set foreground to magenta.
tput setaf 6 # Set foreground to cyan.
tput setaf 7 # Set foreground to white.
tput setaf 9 # Set foreground to default.

# Set text attributes
tput bold # Bold text.
tput dim # Dim text.
tput smul # Start underline.
tput rmul # Stop underline.
tput rev # Reverse video.
tput smso # Start standout.
tput rmso # Stop standout.
tput blink # Blink text.

# Controlling the cursor.
tput home # Move to home position (0,0).
tput sc # Save cursor position.
tput rc # Restore cursor position.

tput cup 1 5 # Move cursor to row 1 column 5, top left corner is 0,0.
tput cuf 5 # Move cursor forward 5 columns.
tput cub 5 # Move cursor back 5 columns.
tput cuu 5 # Move cursor up 5 rows.
tput cuu1 # Move cursor up one row.
tput cud 5 # Move cursor down 5 rows.
tput cud1 # Move cursor down one row.
tput ll # Move cursor to last line.

tput civis # Hide cursor.
tput cnorm # Show cursor.

# Get terminal info.
tput longname # Terminal name.
tput lines # Number of lines.
tput cols # Number of columns.
tput colors # Number of colors.

# Clear and insert lines.
tput clear # Clear screen.
tput ech 5 # Erase 5 characters.
tput el # Erase to end of line.
tput el1 # Erase to end of line.
tput ed # Erase to end of screen.
tput ich 5 # Insert 5 characters.
tput il 5 # Insert 5 lines.

tput smcup # Start screen.
tput rmcup # Restore screen.
# Example:
# tput smcup
# clear
# read -n1 -p "Press any key to continue..."
# tput rmcup


# Miscellaneous.
tput bel # Bell.
tput ht # Horizontal tab.
tput flash # Flash screen.


# X(0X)B" | tr 'X' '\033
