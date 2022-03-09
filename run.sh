#!/usr/bin/env bash

# plugins bash moderen
. lib/moduler.sh
# depencies
Bash.import: text_display/colorama text_display/IO.ECHO
Bash.import: util/io.class util/IO.FUNC
Bash.import: util/operator util/IO.SYSTEM.var

class app
{
	public: app = compile
	public: app = run

	def: app::run(){
		if [[ ! -f "animasi.o" ]]; then
			gcc donat.c -o animasi.o -lm
			clear;./animasi.o
		else
			rm animasi.o
		fi;
	};

	def: app::compile(){
		gcc donat.c -o "$@" -lm
                eval "./$@"
	}
}; class.new: app app_run

def: validations(){
	if [[ ! -f "$1" ]]; then
		println_info " file $1 already there please use another name"; exit 2
	fi
}

trap "clear; rm -rf animasi.o; exit" INT

Namespace: run.sh
{
	case $1 in
			(running) {
				app_run.run
			}; ;;

			(compile) {
				read -p "Output name : " output

				var get_input : "${output:-animasi.o}"
				validations "$get_input";app_run.compile "$get_input"
			}; ;;
			(*) {
			 	exit
			 }; esac
}
