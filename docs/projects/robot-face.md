#Robot Face

##4/22/25
- Russ said to look at abosolute positioning and z-index for blood drops
- Amber said to read this [article on droplet effect](https://deothemes.com/css-animated-rain-drop-effect/) She specificly said to read it line by line.

##4/28/25

###Hair
- I am trying to position the element with the class of ".robot-hair-style" on top of ".robot-face-shape" the image below shows what it is now. I beleive the best way to do this is to use a relitive position but I am wondering how you can get it right without trial and error... I feel that there should be a way to acomplish this without that. ![Robot face befor hair is moved](../assets/Robot-face-pre-hair-positioned.png)
- It did work to do it that way using the code 
```.robot-hair-style {
  position: relative;
  left: 46vw;
  top: -50vh;
}```
however I was surprised by the needing to use `-50vh` for the vertical positioning... I had was guessing that it would have been closer to `10vh`. As of yet I have not been able to figure out why this is. In my current understanding `top: 10vh;` indicates that it will position from the top of the viewport 10 vh units down to the top of the element being positioned. ![Robot face after hair is positioned](../assets/Robot-face-post-hair-positioned.png)
- It still does not scale the way I want it to but it does give me some range of flexibility. I think that a possible update would be to use the font size we set in `robot-container` and use rem similer to the way we made the hair properly scale but I do not understand that enough yet to be sure. It is also possible that we could use absolute and figure out how to give it a position relitive to the face... 
