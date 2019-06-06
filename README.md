# Daffodils

This project defines an animated version of the poem [Daffodils](https://www.poetryfoundation.org/poems/45521/i-wandered-lonely-as-a-cloud), as written by William Wordsworth in 1804. I do not take credit for any of the images or language used in the project, nor do I wish to - this is merely a beginner's exploration into the realm of computer graphics.

## Author
Simon Britton, a freshman currently enrolled in the AP Computer Science course at Francis Parker

## Installation
Simply clone this repository on Github, or download the files as a .zip folder. They are also available in Google Drive, though access is restricted to those attending or working at Francis Parker School. 

## Usage
Once you have downloaded the contents as described above, open the sketch folder with Processing. If you do not currently own Processing, you can download it [here](https://processing.org/). A round play button should appear near the top-left corner of the application window. Click on it, and enjoy the show!

## Code Excerpt
Just to make sure you downloaded the proper files...
```java
/* 
 Project Name: Daffodils
 Project Description: This is Simon Britton's final project for AP Computer Science A. The following program defines an animated version of Daffodils, as written by William Wordsworth.
 */

import processing.sound.*;
SoundFile scene2, scene3, scene4, scene5, scene6, scene7, scene8, scene9, scene10, scene11, scene12, scene13;

Animable[] scenes;
Animator animator;
int currScene, FRAME_RATE;
PFont body24, title;
String[] lines;

color BLACK = #000000;
color LEAF_GREEN = #3A5F0B;
color MIDNIGHT_PURPLE = #3D2A74;
color SKY_BLUE = #87CEEB;
color WHITE = #FFFFFF;
```

## License
[Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
