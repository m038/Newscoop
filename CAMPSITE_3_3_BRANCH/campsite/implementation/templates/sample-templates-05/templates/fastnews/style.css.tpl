/* Fastnews Sample CSS template for Campsite */
/* by Douglas Arellanes (douglas@campware.org) */
/* Licensed under the GNU GPL. See http://gnu.org for details.*/


/* This is a working prototype that uses CSS stylesheets to control all aspects of page layout under Campsite.*/

/* Feel free to change any values to ones you like, load up the page in question and hit refresh on your browser to see the results.*/

a {
	color: #036;
	text-decoration: none;
	font-weight: normal;
}
a:hover {color: #900; text-decoration: underline;}
a:active {text-decoration: underline overline;}
a img {border: none;}

form {
margin: 0;
padding: 0;
}

input, textarea {
background-color: #eee;
border: 1px solid #aaa;
font-size:95%;
}

/*=======HEADER LAYOUT============*/
.whole-page {
/*background-color: gray */
top: 20;
left: 50;
width: 800px;
position: absolute;
border-style: none;
}

.header-container {
/*background-color:green;*/
background-image: none; /* Point to the directory with your background image, such as your logo */
border-bottom: medium solid #ff0000;
border-top-color: none;
border-width: thin;
float: left;
position: relative;
width: 100%;
}

.header-right-container {
/* background-color: yellow;*/
width: 60%;
float: right;
bottom: 0px;
}

.header-left {
/* background-color: gray;*/
margin: 0px;
float: left;
bottom: -45px;
}

.header-middle {
/* background-color: blue;*/
margin: 0;
position: relative;
width: 50%;
float: left;
bottom: -20px;
}

.header-right {
/* background-color: red;*/
margin: 0px;
width: 40%;
float: right;
position: relative;
bottom: 0; }
/* ============END OF HEADER ===========*/

/* ===============MAIN============*/

.main-container {
/* background-color:green;*/
border-style: none;
/*border-right-width: 1px;*/
/*border-left-width: 1px;*/
/*border-top-width: 1px;*/
/*border-bottom-width: 1px;*/
border-color: none;
float: left;
position: relative;
width: 100%;
}

.main-left-column {
top: 0;
text-align: left;
margin: 4px;
margin-left: 0;
padding-top; 2%;
padding-left: 1%;
padding-right: 1%;
border-style: solid;
border-width: thin;
border-right-color: inherit;
border-left-color: inherit;
width: 16%;
float: left;
background-color: #eaeaea;
position: relative;
height: 100%;
}

.main-middle-column {
top: 0;
text-align: justify;
margin: 5px;
width: 77%;
padding-left: 1%;
padding-right: 1%;
float: left;
/*background-color: red; ========= helpful for debugging */
}

.main-right-column {
top: 0;
margin: 4px;
margin-right: 0;
padding-left: 1%;
padding-right: 1%;
border-style: solid;
border-width: thin;
border-right-color: inherit;
border-left-color: inherit;
width : 10%;
float: right;
}

.search-box {
margin: 4px;
background-color: white;
border-style: solid;
border-width: thin;
border-color: black;
}

/* =========FOOTER===================*/

.footer-container {
width: 100%;
/* background-color: purple;*/
}

/* ========TEXT FORMATTING===========*/

.small-sans-serif-text {
font-size: 11px;
font-family: 'Bitstream Vera Sans', 'Verdana', 'Arial', sans-serif;
}

.small-serif-text {
font-size: 13px;
font-family: 'Georgia', 'Times New Roman', sans-serif;
}

.medium-text {
font-family: 'Georgia', serif;
font-size: 18px;
}

.big-text {
font-family: 'Georgia', serif;
font-size: 72px;
font-style: Italic;
}

.normal {
font-family: 'Georgia', serif;
font-size: 11px;
color: black;
text-align: left;
}

.article-name {
font-family: 'Georgia', serif;
font-size: 24px;
font-weight: bold;
text-align: left;
color: black;
}

.body-text {
font-family: 'Georgia', serif;
font-size: 12px;
font-style: plain;
text-align: justify;
line-height: 140%;
}

.deck {
font-family: 'Georgia', serif;
font-size: 12px;
font-weight: bold;
text-align: justify;
line-height: 130%;
}

.error {
font-family: 'Georgia', serif;
font-size: 18px;
font-weight: bold;
text-align: left;
font-color: red;
}

.clear {
clear: both
}

/*=========END OF TEXT FORMATTING===========*/

/*=========END OF STYLESHEET================*/