
install 					: install-server install-client

install-server 		: server/package.json
										cd server;		\
										npm install;  \
										cd ..;				\

install-client		:	client/package.json
										cd client;		\
										npm install;	\
										cd ..;				\

install-database	:	database/createdb.sql
										psql 											\
										--host localhost 					\
										--port 5432 							\
										--username postgres 			\
										bugmo 										\
										-f database/createdb.sql

build-client	:	client/webpack.config.js
								cd client;			\
								webpack;

run-webpack-dev-server 	: client/webpack-dev-server.js
													cd client;											\
													node webpack-dev-server.js;

run-dev-server  	: server/src/index.js
										NODE_ENV=development NODE_CONFIG_DIR=server/config node server/src/index.js

run-graphql-server 	: server/src/graphql-server.js
											cd server;											\
											node src/graphql-server.js;
