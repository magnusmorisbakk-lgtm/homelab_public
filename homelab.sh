#!/bin/bash

STACKS=("monitoring" "game-servers" "moriscribe")

run_stack() {
   local action="$1"
   local stack="$2"
   local stack_dir="services/${STACKS[stack]}"

   echo " running ${action} on stack: ${STACKS[stack]}"
   echo "----------------------------------------"

   for sub_dir in "$stack_dir"/*/; do
       if [ -d "$sub_dir" ] && [ -f "${sub_dir}docker-compose.yml" ]; then
           echo " -> Executing on $(basename "$sub_dir")..."
           docker compose -f "${sub_dir}docker-compose.yml" ${action} "${@:3}"
       fi
   done
}

select_stack() {
   echo
   echo "Stacks:"
   echo

   for ((i = 0; i < ${#STACKS[@]}; i++)); do
       echo " $((i+1)) ${STACKS[i]}"
   done

   echo
   read -rp "Select stack : " stack

   selected_stack=$((stack - 1))

   echo
   echo " Selected stack: ${STACKS[selected_idx]}"
   echo
}

stack_action() {
   select_stack
   run_stack "$@" "$selected_stack"
}


while true; do
   clear
   echo "--------------------------"
   echo "Serivce manager interface "
   echo "--------------------------"
   echo
   echo " [1] Start stack"
   echo " [2] Stop stack"
   echo " [3] Restart stack"
   echo " [Q] Quit"
   echo

   read -rp "Select option: " option

   case "$option" in
       1)
           stack_action up -d
       ;;

       2)
           stack_action down
       ;;

       3)
           stack_action restart
       ;;
       
       q|Q)
           exit 0
       ;;

   esac

   echo
   read -rp "Press enter to continue"

done