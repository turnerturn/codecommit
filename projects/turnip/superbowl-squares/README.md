# superbowl-squares
This is designed as a static html page which uses javascript's localstorage feature to provide a hacky solution on generating super bowl squares for your next event!

This is implemented where team names can be configured per the current year's super bowl.  Default home team will be assigned to the Dallas Cowboys when localstorage memory does not specify.  Default away team will specify Kansas City Chiefs when localstorage memory does not specify. 


## Usage
- Click the nav's hamburger icon and select the "Create Board" action when you are ready to initialize a new board for the 10x10 squares.  Warning this will clear all localstorage memory, so dont click this if your board game is in progress.
- When the new board is rendered, continue clicking the "Purchase Squares" button when someone desired to purchase squares.
- Enter the inputs on this modal for purchasing squares.  (input quantity of squares being purchased and initials of the purchaser's name. Click submit when all inputs are accurate.
- The unnasigned squares will be collected and the purchased quantity of squares will be randomly assigned to the purchaser's initials.
- Click "start game" 
- When the "start game" button is clicked then 0-9 point values will be assigned to row 1 and column a of our 10x10 grid. No more squares can be purchased.   The home team will be designated for column a points.  The away team will be designated for column b points.
> **TIP:** To avoid losing the memory of this generated board, make sure to save the resulting html as pdf.  
- At the end of each quarter of our game, the last digit of each team's score will determine the winning square of our grid.  i.e.. if chiefs (away) have 32 points and eagles (home) have 45 points then the winning square will have column a's designated value of "5" and row 1's designated value of "2".
