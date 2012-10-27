//home for the data
$HOME/pgsql/bin/initdb 		$HOME/ConcatenativeSynthesis/pgsql_data

//start and stop with logfile flag
$HOME/pgsql/bin/pg_ctl -D   $HOME/ConcatenativeSynthesis/pgsql_data -l logfile start
$HOME/pgsql/bin/pg_ctl -D   $HOME/ConcatenativeSynthesis/pgsql_data -l logfile stop


//conf file for port conflicts resolution
$HOME/pgsql/data/postgresql.conf

//prompt
$HOME/pgsql/bin/psql -p 5432 postgres