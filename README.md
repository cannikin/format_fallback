## The Problem

Let's say you're going to start building a mobile version of your site. You use something like
[mobile fu](https://github.com/brendanlim/mobile-fu) which gives you a new format, `:mobile`, which
is automatically set if a request comes in from a mobile device.

All you need to do to start serving your mobile pages is to create a `.mobile` version of your views:

    index.html.erb -> index.mobile.erb

Great! The only downside is that now you need `.mobile` versions of every view in your site right
away. Even worse, you need `.mobile` version of every _partial_ in your site. Sometimes you might
just want a new application layout for mobile and let everything else stay just the way it is.
Enter Format Fallback.

## The Solution

Format Fallback simply tries to get a `.html` version of a view if the initial format lookup fails.
So if Rails tries to get `index.mobile.erb` it will normally throw a `MissingTemplate` error. Now it will
switch formats to `.html` and try to get that instead. Then, if `.html` isn't found, you'll get a 
`MissingTemplate` error (which will, by the way, list the original format that couldn't be found, 
not `.html`).

Enjoy!

## Caveats

Format Fallback doesn't currently let you provide any options to say, for example, "only fall back
to `:html` if `:mobile` isn't found." It will attempt to fall back for *any* template that isn't found.
Rails is generally trying to help you by telling you that a given template is missing so that you 
know you have to go in and add one. Which means if you're working on some new `:csv` versions of your
pages but forget to add one, and there is a requisite `:html` version, Rails will now serve the `:html`
version automatically. Someone would probably find this in testing, but it's something to be aware of.
