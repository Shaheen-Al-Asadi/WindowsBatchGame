::-----------------------------------
::"The Bar Game" By Shaheen Al-Asadi
:: Text Based Adventure Created on: April 20th 2016
:: This Batch file simulates hanging out at a Local Bar in Toronto

@echo off

Set /a num=(%Random% %%9)+1
color %num% 

title The Crave

::-----------------------------------
:: Initial Screen Display
::-----------------------------------
 
:startgame

echo.
echo ==============================================================================
echo.
echo #######                   #####                              
echo    #    #    # ######    #     # #####    ##   #    # ###### 
echo    #    #    # #         #       #    #  #  #  #    # #      
echo    #    ###### #####     #       #    # #    # #    # #####  
echo    #    #    # #         #       #####  ###### #    # #      
echo    #    #    # #         #     # #   #  #    #  #  #  #      
echo    #    #    # ######     #####  #    # #    #   ##   ###### 
echo.
echo ==============================================================================
echo.
echo         _......_
echo  , __.-'\______\\'.______
echo  >`  '-`.--------'---`-`-`-.
echo /    .-. \________ "" .-.  =\
echo '---( o )------------( o )--'
echo===============================================================================
echo.

pause
cls
color 71

echo.
echo ==============================================================================
echo.
echo Welcome to the Crave Dive Bar and Grill 
echo.
echo You walk in and take a seat at the edge of the bar
echo.
echo The bartender comes up to you and says "Welcome, What's your Name" 
echo.
echo ==============================================================================
echo.
set /p name=
echo.
echo "Hello %name% , We hope you enjoy your stay at the bar" says the Bartender
echo.
pause
cls

::-----------------------------------
:: Declaring initial Skill levels
::-----------------------------------
 
set /a drunk = 0
set /a money = 100
set /a poolskill = 1
set /a poolloss = 0


::-----------------------------------
:: Bar Menu Function
::-----------------------------------
 
echo.
echo You look around, you see the Bartender and dozens of people playing at the Pool table

:bar
echo.
echo What would you like to do? [ DRINK , PLAY , CHAT , STATS , LEAVE ] 
echo.

set /p variable=
IF NOT DEFINED variable (GOTO bar)

set result=false
if %variable% == drink set result=true
if %variable% == play set result=true
if %variable% == chat set result=true
if %variable% == stats set result=true
if %variable% == leave set result=true

if "%result%" == "true" (
    
if %variable% equ drink goto drink

if %variable% equ play goto play

if %variable% equ chat goto chat

if %variable% equ stats goto stats

if %variable% equ leave goto leave

)else (

echo %variable% is not a Valid answer
echo.
goto bar
)

::-----------------------------------
:: Displays Stats and Inventory
::-----------------------------------
 
:stats
cls

echo ==============================================================================
echo.
echo Your name is %name%
echo.
echo Your pool playing skill is level %poolskill%
echo.
echo You have $%money% in your wallet
echo.
echo You are %drunk% Percent Drunk
echo.
echo You have won %poolskill% Pool games and lost %poolloss% games
echo.
echo You have %experience% Experience points
echo.
echo ==============================================================================
echo.

pause
cls
goto bar

::-----------------------------------
:: Drinking Function
::-----------------------------------
 
:drink
cls

if %money% leq 14 (
echo.
echo You have no money left for any drinks, play pool to make money!
echo.
echo You have $%money% and Drinks cost $15

goto bar)

set /a drunk = drunk + 17
set /a money = money - 15
set /a experience = experience + 2

if %money% geq 7 (
echo.
echo The Bartender pours you a shot, you have $%money% left in your wallet
echo.

if %drunk% geq 100 (
echo You rush to the bathroom to vomit, you feel a little better now
set /a drunk = drunk - 39
echo. )
)
echo you are now %drunk% Percent Drunk
goto bar

::-----------------------------------
:: Pool Playing and Betting Function
::-----------------------------------
 
:play 
cls

set /a foundcash=(%RANDOM%*100/32768)

if %money% leq 10 ( 
set /a money = money + foundcash
echo.
echo You find $%foundcash% on the floor! Lucky you! 
)

echo.
echo Your pool playing skill is level %poolskill%
echo.
echo How much would you like to bet on a pool game? You have $%money%
echo.
set /p bet=

if %bet% gtr %money% ( 
echo.
echo You dont have that much money!
echo.
pause
goto play
)

echo.
echo You place a bet of $%bet% against Tony Pepperoni, the local Poolshark 

echo.
echo ----- RESULTS OF THE POOL GAME -----
echo.

set /a rand=(%RANDOM%*100/32768) + ((poolskill+drunk)/3)

if %rand% geq 51 (
set /a money = money + bet
set /a poolskill = poolskill + 1
set /a experience = experience + 3 )

if %rand% geq 51 (
echo You won the pool game! You now have $%money% in your wallet!
echo.
echo Your chance to win the game was %rand% Percent, Awesome!
echo.
echo LEVEL UP! Your Pool Playing Skills are now Level %poolskill%
echo.
pause
cls
goto bar
)

set /a money = money - bet
set /a poolloss = poolloss + 1
echo You lost the pool game! You now have $%money% in your wallet
echo.
echo Your chance to win the game was %rand% Percent, Better luck next time!
echo.
pause
cls
goto bar

::-----------------------------------
:: Bar Social Event Function
::-----------------------------------
  
:chat
cls

if %poolskill% geq 5 (
echo.
echo You walk up to a group of Ladies
echo.
echo "Hey whats up my name is %name%....How are you doing tonight"
echo.
echo * The girls have noticed you winning at pool, you start chatting *
echo.
echo One of the girls gives you her phonenumber! Awesome!
echo.
pause
cls
goto bar
)

echo.
echo You walk up to a group of Ladies
echo.
echo "Hey whats up my name is %name%....How are you doing tonight"
echo.
echo * The girls look the other direction, its awkwardly silent *
echo.
echo You walk back to the bartender
echo.
pause
cls
goto bar

::-----------------------------------
:: Leaving Function
::-----------------------------------
 
:leave
echo.
echo You get bored of the bar and go outside
echo.
echo You notice the developer forgot to add other enviroments...
echo.
echo A Magical force attempts to teleport you back inside the bar!
echo.
echo Do you want to Exit the simulation [ YES, NO ] 
echo.
echo *WARNING* This will Close the Game *WARNING*
echo.
set /p exitanswer= 

if %exitanswer% == yes (
echo.
echo Exiting Program, Thanks for Playing!
pause
exit /b
)

echo.
echo You feel a surge of Energy transporting you back inside!
echo.
pause
cls
goto bar




