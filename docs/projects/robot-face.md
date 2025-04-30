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

##4/29/25

###LH Ear
I am working on the LH ear and I used the code snippet found below that I got from [here /#30](https://css-generators.com/tooltip-speech-bubble/)
<details>
  <summary>Click to expand code snippet</summary>

```/* HTML: <div class="tooltip">This is a Tooltip with a border and a border radius. Border and background have a gradient coloration </div> */
.tooltip {
  color: #fff;
  font-size: 18px;
  max-width: 28ch;
  text-align: center;
}
.tooltip {
  /* triangle dimension */
  --a: 90deg; /* angle */
  --h: 1em; /* height */

  --p: 49%; /* triangle position (0%:left 100%:right) */
  --b: 5px; /* border width */
  --r: 1.2em; /* the radius */

  padding: 1em;
  border: var(--b) solid #0000;
  border-radius: min(var(--r), var(--p) - var(--h) * tan(var(--a) / 2))
    min(var(--r), 100% - var(--p) - var(--h) * tan(var(--a) / 2)) var(--r)
    var(--r) / var(--r);
  background: padding-box linear-gradient(-30deg, #563444, #cf9d38),
    /* background gradient */ border-box
      repeating-conic-gradient(#2f505e 0 8deg, #ffd109 0 16deg); /* border gradient  */
  background-size: 100% calc(100% + var(--h));
  background-position: bottom;
  position: relative;
  z-index: 0;
}
.tooltip:before,
.tooltip:after {
  content: "";
  position: absolute;
  z-index: -1;
  inset: calc(-1 * var(--b) - var(--h)) calc(-1 * var(--b)) calc(-1 * var(--b));
  background: inherit;
}
.tooltip:before {
  background-size: 0 0, 100% 100%;
  clip-path: polygon(
    min(100%, var(--p) + var(--h) * tan(var(--a) / 2)) calc(var(--h) + var(--b)),
    min(100%, var(--p) + var(--h) * tan(var(--a) / 2)) var(--h),
    var(--p) 0,
    max(0%, var(--p) - var(--h) * tan(var(--a) / 2)) var(--h),
    max(0%, var(--p) - var(--h) * tan(var(--a) / 2)) calc(var(--h) + var(--b))
  );
}
.tooltip:after {
  border: inherit;
  background-size: 100% 100%, 0 0;
  clip-path: polygon(
    min(
        100% - var(--b),
        var(--p) + var(--h) * tan(var(--a) / 2) - var(--b) *
          tan(45deg - var(--a) / 4)
      )
      calc(var(--h) + var(--b)),
    var(--p) calc(var(--b) / sin(var(--a) / 2)),
    max(
        var(--b),
        var(--p) - var(--h) * tan(var(--a) / 2) + var(--b) *
          tan(45deg - var(--a) / 4)
      )
      calc(var(--h) + var(--b)),
    50% 50%
  );
}

</details>```


