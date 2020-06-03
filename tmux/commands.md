## Start Session with the session name
`tmux new -ssession_name`

## Exit Session
`exit`
`prefix + d`

## Attach Session
`tmux attach -tsession_name`

## Detach Session
`prefix + d`

## Session List
`tmux ls`


## Switch between sessions:
```
<prefix> (          previous session

<prefix> )          next session

<prefix> L          ‘last’ (previously used) session

<prefix> s          choose a session from a list
```
## Change Session Numbering

`<prefix> + $`

## Reset tmux
`tmux kill-server`

## Create Window
`<prefix> + C`

## Change Window Name
`<prefix> + ,`

## Kill the Current Window
`<prefix> + &`


## Switch between windows:
```
<prefix> 1 ...      switch to window 1, ..., 9, 0

<prefix> 9

<prefix> 0

<prefix> p          previous window

<prefix> n          next window

<prefix> l          ‘last’ (previously used) window

<prefix> w          choose window from a list
```

# Managing split panes

## Split Vertically (top/bottom)
`<prefix> + "`

## Split Horizontally (left/right)
`<prefix> + %`

## Kill the Current Pane
`<prefix> + x`

## navigation in the multiple panes
```
<prefix> + arrow-left
<prefix> + arrow-right
<prefix> + arrow-bottom
<prefix> + arrow-top
```

## Resize panes

`<prefix> + :`

this will open a command pellet at the bottom of the terminal

use these commands to resize the panes. not this will work on the currect active pane
```
:resize-pane -D (Resizes the current pane down)
:resize-pane -U (Resizes the current pane upward)
:resize-pane -L (Resizes the current pane left)
:resize-pane -R (Resizes the current pane right)
:resize-pane -D 10 (Resizes the current pane down by 10 cells)
:resize-pane -U 10 (Resizes the current pane upward by 10 cells)
:resize-pane -L 10 (Resizes the current pane left by 10 cells)
:resize-pane -R 10 (Resizes the current pane right by 10 cells)

```




