ruleset HelloWorldApp {
  meta {
    name "Hello World"
    description <<
      Hello World
    >>
    author "Ryan Bird"
    logging off
    use module a169x701 alias CloudRain
    use module a41x196 alias SquareTag
  }
  dispatch {
    notify("Dispatched");
    alert("Dispatched Alert");
  }
  global {
    notify("Global");
    alert("Global Alert);
  }
  rule HelloWorld is active {
    select when web cloudAppSelected
    pre {
        my_html = <<
            <h5>Hello, World! Number 5</h5>
        >>;
        //notify("Done with assignment");
        //alert("Pre Alert");
    }
    {
        alert("Stuff");
        SquareTag:inject_styling();
        CloudRain:createLoadPanel("Hello World", {}, my_html);
        notify("This is a notification");
    }
  }
}
