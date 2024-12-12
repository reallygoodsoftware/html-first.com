
HTML First is a style of writing web software that favours using the native capabilities and languages of the browser and reducing layers of abstraction (languages and toolchains) on top of them.  

# Introduction

Modern web development has changed a lot in the last decade. Before libraries like [React](https://react.dev/) came along, the common approach was to write your interfaces with html and use something like [jQuery](https://jquery.com/) to paper over the things html didn't natively support, like sending [asynchronous requests](https://api.jquery.com/jQuery.get/) or updating the dom. 

These new libraries solved a lot of problems - in particular the pattern of explicitly passing data from parent elements to children (what react calls `props` and `state`), removed a whole category of bugs and gave developers much more confidence when building new features. The approach also made it easy to "bundle together" ui, styling, and behaviour into components, which meant you could easily "install" things that other people had built, into your own codebase.

The drawback was that in order to reap these benefits, you had to switch from writing mainly html, to writing mainly javascript - a much more complicated language, and you had to learn the new concepts and tools that react introduced, of which there were [many](https://roadmap.sh/react). 

Despite the added complexity, the industry as a whole decided the tradeoffs were worth it, and these libraries became the go-to way to build web apps. One consequence of this was that, before React, new developers would focus *first* on learning HTML and CSS, *then* on Javascript, whereas after React, they would focus first on learning Javascript and React, then on learning everything else.

**The React Learning Journey**

![Diagram showing react learning journey](/images/react-roadmap.jpg "State Comparison")

### A Quiet Development

In the meantime, while everyone was busy adopting and learning the React way, the people at the [W3C](https://www.w3.org/), [WHATWG](https://whatwg.org/), [IETF](https://www.ietf.org/), and [TC39](https://tc39.es/) continued to add thousands of improvements to the native languages of the web, which were integrated into Chrome, Safari, Firefox, and Edge. Many of these improvements addressed many of the reasons that people were using React in the first place.

In recent years, as the cost of building software has risen, and these improvements have made their way into everyone's browsers, a growing number of people have begun to ask. "Is all of this stuff we added actually still *necessary* today?".

### The Goal Of This Website

Despite some progress in the last few years, the ideas on this site still represent a tiny minority of the people in the industry.  

This site exists as an accelerant for those who are already html-curious but lacking the language or concepts to harden their own thinking or communicate with their colleagues. It's not designed to convince people who are perfectly happy with the React way that this way is better. 

If there's one thing I'd like you to take away from this site, it's that **it is possible, practical, and perfectly reasonable, to build beautiful, fast, easy-to-use, accessible web software using primarily the native languages and capabilities of the web.**



<div id="guidelines"></div>

<br/>
