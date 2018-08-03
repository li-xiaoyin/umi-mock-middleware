@echo off
cd %~dp0
call npm config set registry https://registry.npmjs.org/
call npm login
call npm publish
call npm logout
call npm config set registry http://localhost:8581/repository/npm-group/
pause