x-session.sh
#!/bin/sh

SESSION_NAME="DEV"
FRONTEND="frontend"
BACKEND="backend"
MOCK_SERVER="mockserver"
CONSOLE="console"
FRONTEND_ALIAS="fe"
BACKEND_ALIAS="be"
MOCK_SERVER_ALIAS="ms"
FE_DIR_ALIAS="fedir";
BE_DIR_ALIAS="bedir"
MS_DIR_ALIAS="msdir"
FE_START_COMMAND="echo Hello Tony"
BE_START_COMMAND="echo Hello Tony"
BE_VENV="echo virtual"
tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
  set -- $(stty size) # $1 = rows $2 = columns

  # Create the session with frontend as first tab
  tmux new-session  -s ${SESSION_NAME} -n ${FRONTEND} -d -x "$2" -y "$(($1-1))"

  # frontend window
  tmux send-keys -t ${SESSION_NAME} ${FRONTEND_ALIAS} C-m
  tmux split-pane -h -p 20
  tmux send-keys "$FE_DIR_ALIAS" C-m
  tmux send-keys "$FE_START_COMMAND" C-m
  tmux select-pane -t 0


  # backend window
  tmux new-window -n ${BACKEND} -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME} ${BACKEND_ALIAS} C-m
  tmux split-pane -h -p 20
  tmux send-keys "$BE_DIR_ALIAS" C-m
  tmux send-keys "$BE_VENV" C-m
  tmux send-keys "$BE_START_COMMAND" C-m
  tmux select-pane -t 0


  # mock server window
  tmux new-window -n ${MOCK_SERVER} -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME} ${MOCK_SERVER_ALIAS} C-m
  tmux split-pane -h -p 20
  tmux send-keys "$MS_DIR_ALIAS" C-m
  tmux select-pane -t 0

  # general purpose console

 #tmux new-window -n ${CONSOLE} -t ${SESSION_NAME}
  tmux new-window -n ${CONSOLE} -t ${SESSION_NAME}
  tmux send-keys "cd" C-m

  # Start out on the first window when we attach
  tmux select-window -t ${SESSION_NAME}:${FRONTEND}
fi
tmux attach -t ${SESSION_NAME}
