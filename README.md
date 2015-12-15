# Plexport Media Mover

CONTENTS

1.  About Plexport
2.  Installation Instructions
3.  Using Plexport
4.  Settings
5.  Planned enhancements


## PART 1: About Plexport

Plexport streamlines the process of importing new media files into Plex, or really any other home media center where you want files to be reasonably named and organized. Despite the name, it actually doesn't (yet) do anything with Plex at all; it simply renames and moves files into your libraries, where Plex--or whatever--can find them and import them.

So basically it does this:

     .............................................................
     : T:\Downloads                                              :.
     :    \The.Martian.2015.HDRIP.AAC.720p.c0rnBallz             ::
     :         \please-seed-me.txt                               ::
     :         \ripped-by-c0rnBallz.jpg                          ::
     :         \The.Martian.2015.HDRIP.AAC.720p.c0rnBallz.mkv    ::
     :         \The.Martian.2015.HDRIP.AAC.720p.c0rnBallz.nfo    ::
     :         \The.Martian.2015.HDRIP.AAC.720p.c0rnBallz.srt    ::
     :         \this.file.is.just.plain.garbage.txt              ::
     :                _                         _                ::
     :               | |                       | |               ::
     :              _| |_                     _| |_              ::
     :              \   /  P L E X P O R T !  \   /              ::
     :               \ /                       \ /               ::
     :                V                         V                ::
     : P:\Library\Movies                                         ::
     :     \Martian, The (2015)                                  ::
     :         \Martian, The (2015).mkv                          ::
     :         \Martian, The (2015).eng.srt                      ::
     `::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`

...which, yeah, is something you can do yourself manually. But doing it manually is annoying and tedious and lame, and this is 2015. You shouldn't be doing tedious lame things; you should be doing awesome futuristic things. So go find yourself a Hoverboard to ride, and let Plexport move your stupid files around for you.


## PART 2: Installing Plexport

Installing Plexport is a journey in two steps:

1.  Run the setup package. If you can, you want to do this with admin rights or it may not work out so great. Setup does a few things for you:

    a.  It extracts Plexport.exe and its supporting files into whatever folder you tell it to, which would normally be your Windows Program Files, but I'm not judging.
    
    b.  It asks you for the locations of your movie and TV libraries. You can change these at any time later, but it's convenient to have it out of the way now.

    c.  It creates keys in the Windows registry to make Plexport available via the context menu in Windows Explorer. No restart required! This allows you to run Plexport directly on a file or folder by right-clicking it and choosing Plexport from the menu. It's super.

    d.  It adds shortcuts to Plexport in your Windows Start Menu.

2.  There is no step 2 there is only Zuul.


## PART 3: Using Plexport

It really should be fairly self-explanatory, but there might be a few tips that you might like to about that aren't totally obvious.

+   You can launch Plexport directly and browse to a file or folder, or by right-clicking a file in Windows Explorer and choosing the Plexport option from the context menu, or by dragging a file or folder onto its icon. Pretty standard, really.
    
+ Plexport will attempt to ascertain whether the file you loaded is a movie or a TV show, and then take a guess at a file name accordingly. If it thinks it's a TV show, it'll run a query to try and find the episode title right away. If you load a file and it can't tell what it is, it will let you know. (It does this by looking for patterns in the file names and it's maybe not going to get it right every time.)
    
+ Plexport gets episode titles from thetvdb.com, using the series name. Sometimes it finds more than one match, so it will prompt you to confirm which one you have. It will then save a small text file in your series folder, so it doesn't have to query again. That text file contains the TVDB's series ID number. You can force Plexport to query for the series ID again either by deleting that text file, or by using the "Recycle" button next to the series name in the window. You can tell Plexport what name to use for that text file by changing the option in the Settings.ini file; there's lots more on that below.
    
+ If you load Plexport with a folder, it will import everything in that folder. If you load a single file, it will import only that file AND any other files it finds next to it that have the same name but a different extension. This is especially handy when you have a folder with many TV episodes and their respective subtitle files. If you have more than one file to process for the same media title, but their file names don't line up like that, you can just run Plexport against them individually, or rename them to match up first and then run it all at once.
    
+ When Plexport imports files, it assumes you only want to keep media and subtitles, so it will un-select the checkboxes for anything else it finds. It will also apply the new file name for relevant files only. You can check and uncheck items yourself from there. Plexport determines relevant files simply by looking at the file extensions.
    
+ You can't directly modify the new file name, but only set values in the fields above it. The new name is produced dynamically for you. However, you CAN change the final names that will be applied on any file in the list, by right-clicking on it. The names that appear in the file list are what each file will be changed to. The New Name text is only a starting point and isn't necessarily the final result.
    
+ If you change file names manually in the file list, make sure to include the extension! Plexport does not check for that. (You can always rename the files after they've been moved, to bring the original extension back. Windows gets a lot more worried about that than Plexport does.)
    
+ There are other options available by right-clicking files in the file list, so you can open files or just view their properties, or revert their names back to the originals.

    
## PART 4: Settings

The advantage to having all of this in an .ini file rather than coded into the script is that it allows you to change things without recompiling the exe file, which is kind of a big deal.

**movieLibrary:** The path to your movie library, so Plexport knows where you want to put your movie files. You can import files FROM anywhere; this is where Plexport will be moving them.

**tvLibrary:** The path to your TV library. This also feeds the TV Series dropdown box.

**tvSeparator1:** Character(s) you want in the file name between Series Name and Season/ Episode Number. This should be in double quotes. It can be a space, a dash, an underscore, an empty string, your mother's maiden name, whatever.

**tvSeparator2** Character(s) you want in the file name between Season/Episode Number and the episode title. This should also be in double quotes. If there is no episode title, this will not be used at all.

**tvEpNbrType:** A code to designate the pattern for applying the season and episode numbers to the file name. Here are the available codes:
    1  :  s01e02
    2  :  s01.e02
    3  :  s01_e02
    4  :  1x02
    5  :  102

**tvEpNbrCase:** Either L or U to designate that you want the S and E in the episode number to be in lower or upper case. (Obviously not every type code uses the S and E, so this won't apply in those... cases. Ha! I punned.)

**tvdbMirrorPath:** The URL to the TVDB web site, used for finding episode titles.

**tvdbAPIKey:** Do you have your own API key? Great! Otherwise just leave it. I'm sure they won't mind if we share.

**datafile:** The name of the file that Plexport will create inside each TV series folder, so it doesn't have to re-query for series IDs. This could have been done in a more opaque way, like saving them to some hidden or temporary location in the bowels of the OS or an INI file or something, but I found it was kind of reassuring to see the little text file right there in the series folder, like a kind of certification that the series had passed the Plexport screening process. And I don't like hiding stuff in obscure places on your disk. It's just better to be up front about it as much as possible.

If you delete this file, it just means Plexport will prompt you to confirm the series next time you try to get an episode title. I honestly don't know what happens if you set this value to blank in the settings file. It'll probably do something unhelpful and/or profane.

**appName:** The shorthand name for the program. Changing this might be a little risky; it's fine within Plexport.exe itself, but the install/uninstall programs don't use it every time for every job. Even having this in the settings file is a symptom of my indecisive nature from before I settled on the name, and it probably should just come out.

**winTitle:** Just a full/longer name, to display in title bars and such. Can be the same as appName if you want to swing that way. Again, change at your own risk!

**inputColor:** The hexadecimal color code for the font in input boxes.

**inputBackColor:** The hexadecimal color code for the background of input boxes.

**labelColor:** The hexadecimal color code for the font in label text.

**blahColor:** The hexadecimal color code for the font of non-critical information text.

**wowColor:** The hexadecimal color code for the font of punchy exciting highlight text. Currently only used for the "New file name" label.

**backgroundColor:** The hexadecimal color code for the background of the whole damn GUI. Set it to black if you're feeling saucy!

**fontSizeSm:** The size for most of the text in the GUI, including labels and info text.

**fontSizeLg:** The size for the input text. I like this a little bigger than the rest, but maybe that offends your more traditional sensibilities.

**fontName:** The name of the font to use in the GUI. If you set this Comic Sans, you do not deserve nice things. And no, I didn't code in some easter egg for that, and if you go looking for one you're just being an asshole.
                    
**labelWidth:** The width for the left-hand column in the GUI. You might need to adjust this if you set the font name or size to be something outrageous.

**inputWidth:** The width of the input boxes. The entire GUI size and positioning of things *should* be a function primarily of these two widths, but if you enter some-thing really obnoxious just to test it, and it breaks, that's on you, man.

**buttonWidthSmall:** The width for the small buttons. They're getting a height of 24, so if you want them to be square, there you go.

**buttonWidthLarge:** The width for the bigger buttons.

**listViewRows:** The number of rows to display in the file browser list in the GUI. (In other words, this is the height of the browser control.)

**inputLeftPadding:** The size of the space to the left of your input boxes before the next thing in that row, if there is anything. You really don't have to overthink this.
                    
**buttonLeftPadding:** The empty space that will go to the right of buttons.

**tab1Name:** This actually never appears on the GUI, but it still needs a name so it can be accessed from the programming. There are those who call this... Tim.

**tab2Name:** The name for the Movie tab. This isn't in here because you're going to want to change it--it's because the program language is a little squicky about how it lets you select different tabs, so binding the names to a settings variable just kind of makes things a little safer. If you change this from "Movie", you're just being difficult.

**tab3Name:** Same as the Movie tab but for TV shows, except MAYBE you honestly, legitimately want it to be something else. So, here you go.

**emptyFileText:** This will appear in the first input box if you haven't selected a file. It's mostly in the Settings file for the same reason as the tab names: it's used in the code and it's better to have it all coming from the same place. You can and maybe should just leave this blank, but it can probably be whatever.
                    
**newNameWaitingText:** Anything you want the New File Name preview to display before it's been started.
                    
**introText:** This message will appear in the body of the GUI if you haven't loaded a file or if the file you load can't be understood as a movie or TV show. It might be helpful to put some instructions here, if you think you'll need it.
                    
**showHelpOnLoad:** Set to 0 (no) or 1 (yes). This will simply make the Help message pop up automatically whenever Plexport is launched, until you uncheck the "Don't show this again" option in the Help--which of course changes this value in the Settings.ini file. Why, that's very... helpful.


## PART 5: The Future!

Here's what we're working on down at Q Branch...

1. Trailers and subtitles. Did you notice the buttons for those in Plexport? They're a little, um, underpowered at the moment.

2. A pretty GUI for settings, so you don't have to edit an INI file and rely on a separate readme file to explain everything. It will also have validations to prevent problems. **STARTED** on 12/14/2015 for TV file name conventions. Will expand to include other settings later. Probably. Whatever.

3. An optional always-on feature that can make Plexport available on any file in Windows Explorer from a hotkey, maybe like Ctrl-P. (I've already got this on my own PC using a great big AutoHotkey script that wires up all kinds of shortcuts to keystrokes, but this would be a case where it could be a stand-alone feature that's bundled with the app.)

4. A more robust setup routine that can check for admin rights and prevent partial or bad installations before they happen.

5. An "About" option to display the current version number of your install, or possibly adding it to the title bar.

6. An option to allow files to be left in their original locations, not moved and/or deleted when the operation runs.

7. A feature to prevent removing file extensions when changing names in the file list, and to prevent illegal characters. (Plexport blocks illegal characters in the input boxes, but you can change file names via the file list.)
