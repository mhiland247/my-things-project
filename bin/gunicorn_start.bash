#!/bin/bash

NAME="things"                              #Name of the application (*)
DJANGODIR=/home/ubuntu/things             # Django project directory (*)
SOCKFILE=/home/ubuntu/things/run/gunicorn.sock       # we will communicate using this unix socket (*)
USER=root                                        # the user to run as (*)
GROUP=www-data                                     # the group to run as (*)
NUM_WORKERS=1                                     # how many worker processes should Gunicorn spawn (*)
DJANGO_SETTINGS_MODULE=things.settings             # which settings file should Django use (*)
DJANGO_WSGI_MODULE=things.wsgi                     # WSGI module name (*)
#MAX_REQUESTS={{ gunicorn_max_requests }}
echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
source /home/ubuntu/things/myv/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec /home/ubuntu/things/myv/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user $USER \
  --bind=unix:$SOCKFILE
 # --max-requests $MAX_REQUESTS \
  --log-level=debug \
  --log-file=-
