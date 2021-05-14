# Wack-A-NutCracker AR Game
I have been interested with mixed reality development for a while now so it made sense for me to make an AR application for this class.  I concurrently working on a VR game and AR app in Unity.  I was very curious to see the differences between using AR Foundations and Unity verses AR kit and Reality Composer. 

<img src="https://cdn.discordapp.com/attachments/701222956478496778/842587547812757524/image0.png" width="250" height="500"> <img src="https://cdn.discordapp.com/attachments/701222956478496778/842587548273606706/image1.png" width="250" height="500"> <img src="https://cdn.discordapp.com/attachments/701222956478496778/842587548512944168/image2.png" width="250" height="500">

## Must have features
* Create an account
* Sign In
* Start Game
* Score points
* Game Over
* Reset Game

## Nice to have features
* Game Timer
* Add time on score
* Different points for different objects
* Store highest score
* Online leaderboard
* different levels

# The Game
<img src="https://cdn.discordapp.com/attachments/701222956478496778/842587548814409778/image3.png" width="250" height="250">

1. Player opens app to a splash screen
2. Logs in or creates an account (Shows error on bad login)

<img src="https://cdn.discordapp.com/attachments/701222956478496778/842587549008527360/image4.png" width="250" height="500">

3. User is sent to start game screen on success (leaderboard not implemented due to time constraints)

<img src="https://cdn.discordapp.com/attachments/701222956478496778/842587549242884126/image5.png" width="250" height="500">

4. User is transitioned to the ARView and prompted to scan for surfaces

![Alt Text](https://media.giphy.com/media/7oCZLNkAWGj8Qux6ii/giphy.gif)

5. Once a surface is scanned, the game will spawn the Start Wacking title
6. On click, the game will spawn 3 nutcrackers that move from left to right at different speeds 

![Alt Text](https://media.giphy.com/media/GBcEomcaDLTEVwrQNL/giphy.gif)

7. The user has a ball that shoots in a straight line on click
8. Hitting the closest Nutcreacker gets you 1 point, the middle 5 points, and the farthest 10 points

![Alt Text](https://media.giphy.com/media/YZ9e90wXPUc7Ad1svN/giphy.gif)

9. If the player missing all nutcrackers, he hits the backstops and the game is over

![Alt Text](https://media.giphy.com/media/eg8vidSuXdAPL4QF8X/giphy.gif)

10. The game also ends when the user's time runs out
11. The user also gains time when he scores
12. After the game is over, the user can reset it and start again

![Alt Text](https://media.giphy.com/media/7JhylgU3Q303XfbCBL/giphy.gif)

## Challenges
* AR doesn't always work as expected, especially in dark areas
* Setting up firebase was new to me and took some research
* Had to cut back leaderboard because of time limitations
* Developing on a Macbook is a huge constraint considering I usually work on my fast gaming PC especially working with Reality Composer 
* ARView came with a viewcontroller that I couldn't add things to so I had to make my own ViewController and add the ARView to it
